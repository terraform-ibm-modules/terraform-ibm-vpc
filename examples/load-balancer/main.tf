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

module "server_cert" {
  source                 = "terraform-ibm-modules/secrets-manager-private-cert/ibm"
  version                = "1.12.10"
  cert_name              = "${var.prefix}-server-cert"
  cert_description       = "Server certificate for LB listener TLS and pool client auth"
  cert_common_name       = "${var.prefix}-server.example.com"
  cert_template          = var.existing_sm_cert_template
  secrets_manager_guid   = var.existing_sm_instance_guid
  secrets_manager_region = var.existing_sm_instance_region
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
      proxy_protocol  = "v2"
      lb_pool_members = []
    }
  ]

  lb_listeners = [
    {
      port         = 443
      protocol     = "https"
      default_pool = "${var.prefix}-pool"
      # Server certificate presented by the LB to connecting clients
      certificate_instance  = module.server_cert.secret_crn
      connection_limit      = null
      accept_proxy_protocol = null
      lb_listener_policies  = []
    }
  ]

  depends_on = [module.vpc]
}
