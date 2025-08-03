##############################################################################
# Locals
##############################################################################

locals {
  ssh_key_id = var.ssh_key != null ? data.ibm_is_ssh_key.existing_ssh_key[0].id : resource.ibm_is_ssh_key.ssh_key[0].id
  subnet_id = [for subnet in module.vpc.vpc.subnet_zone_list :
  subnet.id if subnet.zone == "us-south-1"][0]
}

########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.3.0"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

##############################################################################
# Create new SSH key
##############################################################################

resource "tls_private_key" "tls_key" {
  count     = var.ssh_key != null ? 0 : 1
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "ibm_is_ssh_key" "ssh_key" {
  count      = var.ssh_key != null ? 0 : 1
  name       = "${var.prefix}-ssh-key"
  public_key = resource.tls_private_key.tls_key[0].public_key_openssh
}

data "ibm_is_ssh_key" "existing_ssh_key" {
  count = var.ssh_key != null ? 1 : 0
  name  = var.ssh_key
}

########################################################################################################################
# VPC
########################################################################################################################

module "vpc" {
  source            = "../.."
  vpc_name          = "${var.prefix}-vpc"
  resource_group_id = module.resource_group.resource_group_id
  locations         = ["us-south-1", "us-south-2", "us-south-3"]
  vpc_tags          = var.resource_tags
  address_prefixes = [
    {
      name     = "${var.prefix}-us-south-1"
      location = "us-south-1"
      ip_range = "10.10.10.0/24"
    },
    {
      name     = "${var.prefix}-us-south-2"
      location = "us-south-2"
      ip_range = "10.10.20.0/24"
    },
    {
      name     = "${var.prefix}-us-south-3"
      location = "us-south-3"
      ip_range = "10.10.30.0/24"
    }
  ]

  subnet_name_prefix          = "${var.prefix}-subnet"
  default_network_acl_name    = "${var.prefix}-nacl"
  default_routing_table_name  = "${var.prefix}-routing-table"
  default_security_group_name = "${var.prefix}-sg"
  create_gateway              = true
  public_gateway_name_prefix  = "${var.prefix}-pw"
  number_of_addresses         = 16
}

module "vsi" {
  source              = "../../modules/instance"
  resource_group_id   = module.resource_group.resource_group_id
  vpc_id              = module.vpc.vpc.vpc_id
  number_of_instances = 2
  name                = "${var.prefix}-vsi"
  location            = "us-south-1"
  ssh_keys            = [local.ssh_key_id]
  profile             = "bx2-2x8"
  image               = var.image_id
  # Primary VNI of each of the instances.
  primary_network_interface = [
    {
      subnet         = local.subnet_id
      interface_name = "${var.prefix}-vni"
    },
    {
      subnet            = local.subnet_id
      interface_name    = "${var.prefix}-vni"
      allow_ip_spoofing = true
    }
  ]
}
