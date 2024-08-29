########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.6"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# VPC
########################################################################################################################

module "vpc" {
  source = "../.."
  vpc_name = "${var.prefix}-vpc"
  resource_group_id = module.resource_group.resource_group_id
  locations = ["us-south-1", "us-south-2", "us-south-3"]
  auto_assign_address_prefix = false
  address_prefixes = [{
    name = "${var.prefix}-us-south-1"
    location = "us-south-1"
    ip_range = "10.240.0.0/18"
  }, {
    name = "${var.prefix}-us-south-2"
    location = "us-south-2"
    ip_range = "10.240.64.0/18"
  }, {
    name = "${var.prefix}-us-south-3"
    location = "us-south-3"
    ip_range = "10.240.128.0/18"
  }]
  subnet_name_prefix = "${var.prefix}-subnet"
  default_network_acl_name =  "${var.prefix}-nacl"
  default_routing_table_name =  "${var.prefix}-routing-table"
  default_security_group_name =  "${var.prefix}-sg"
  create_gateway = false
}