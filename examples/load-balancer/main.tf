##############################################################################
# Locals
##############################################################################

locals {
  # Pick the first subnet in us-south-1 for the LB
  subnet_id = [for subnet in module.vpc.vpc.subnet_zone_list :
  subnet.id if subnet.zone == "${var.region}-1"][0]
}

########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.6.1"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# VPC
########################################################################################################################

module "vpc" {
  source                      = "../.."
  vpc_name                    = "${var.prefix}-vpc"
  resource_group_id           = module.resource_group.resource_group_id
  locations                   = ["${var.region}-1", "${var.region}-2", "${var.region}-3"]
  vpc_tags                    = var.resource_tags
  subnet_name_prefix          = "${var.prefix}-subnet"
  default_network_acl_name    = "${var.prefix}-nacl"
  default_routing_table_name  = "${var.prefix}-routing-table"
  default_security_group_name = "${var.prefix}-sg"
  number_of_addresses         = 16
}

########################################################################################################################
# Self-signed TLS certificate (CA) for mTLS testing
########################################################################################################################

resource "tls_private_key" "ca_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "ca_cert" {
  private_key_pem = tls_private_key.ca_key.private_key_pem

  subject {
    common_name  = "${var.prefix}-ca"
    organization = "Example Org"
  }

  validity_period_hours = 8760 # 1 year
  is_ca_certificate     = true

  allowed_uses = [
    "cert_signing",
    "crl_signing",
    "key_encipherment",
    "digital_signature",
  ]
}

# Server certificate signed by the CA above (used as the LB TLS certificate)
resource "tls_private_key" "server_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_cert_request" "server_csr" {
  private_key_pem = tls_private_key.server_key.private_key_pem

  subject {
    common_name  = "${var.prefix}-server"
    organization = "Example Org"
  }
}

resource "tls_locally_signed_cert" "server_cert" {
  cert_request_pem   = tls_cert_request.server_csr.cert_request_pem
  ca_private_key_pem = tls_private_key.ca_key.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.ca_cert.cert_pem

  validity_period_hours = 8760

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

########################################################################################################################
# Import certificates into the existing Secrets Manager instance
########################################################################################################################

# Import the CA certificate — used for mTLS client/server authentication
resource "ibm_sm_imported_certificate" "ca_cert" {
  instance_id     = var.existing_sm_instance_guid
  region          = var.existing_sm_instance_region
  name            = "${var.prefix}-ca-cert"
  certificate     = tls_self_signed_cert.ca_cert.cert_pem
  private_key     = tls_private_key.ca_key.private_key_pem
  secret_group_id = "default"
}

# Import the server certificate — used as the LB listener TLS certificate
resource "ibm_sm_imported_certificate" "server_cert" {
  instance_id     = var.existing_sm_instance_guid
  region          = var.existing_sm_instance_region
  name            = "${var.prefix}-server-cert"
  certificate     = tls_locally_signed_cert.server_cert.cert_pem
  intermediate    = tls_self_signed_cert.ca_cert.cert_pem
  private_key     = tls_private_key.server_key.private_key_pem
  secret_group_id = "default"
}

########################################################################################################################
# Load Balancer with mTLS
########################################################################################################################

module "load_balancer" {
  source               = "../../modules/load-balancer"
  create_load_balancer = true
  name                 = "${var.prefix}-lb"
  subnets              = [local.subnet_id]
  type                 = "public"
  resource_group_id    = module.resource_group.resource_group_id
  tags                 = var.resource_tags

  lb_pools = [
    {
      name                     = "${var.prefix}-pool"
      algorithm                = "round_robin"
      protocol                 = "https"
      health_delay             = 10
      health_retries           = 10
      health_timeout           = 5
      health_type              = "https"
      health_monitor_url       = null
      health_monitor_port      = null
      session_persistence_type = null
      # Forward client connection metadata (including TLS info) to backends
      proxy_protocol = "v2"
      # Verify backend server certificates using the imported CA
      server_authentication = {
        certificate_authority = ibm_sm_imported_certificate.ca_cert.crn
        verify_certificate    = true
      }
      # Require clients connecting to the pool to present a certificate
      client_authentication = {
        certificate_instance = ibm_sm_imported_certificate.ca_cert.crn
      }
      lb_pool_members = []
    }
  ]

  lb_listeners = [
    {
      port         = 443
      protocol     = "https"
      default_pool = "${var.prefix}-pool"
      # Server certificate presented by the LB to connecting clients
      certificate_instance  = ibm_sm_imported_certificate.server_cert.crn
      connection_limit      = null
      accept_proxy_protocol = null
      # Require clients to present a certificate signed by the CA (mTLS)
      client_authentication = {
        certificate_authority       = ibm_sm_imported_certificate.ca_cert.crn
        certificate_revocation_list = null
      }
      lb_listener_policies = []
    }
  ]

  depends_on = [module.vpc]
}
