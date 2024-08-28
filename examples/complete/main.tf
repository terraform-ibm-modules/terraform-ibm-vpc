##############################################################################
# Complete example
##############################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.6"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

module "vpc" {
  source   = "../.."
  vpc_name = "${var.prefix}-vpc"

  resource_group_id = module.resource_group.resource_group_id
  # address_prefixes = var.address_prefixes
  locations           = ["us-south-1", "us-south-2", "us-south-3"]
  subnet_name_prefix  = "${var.prefix}-subnet"
  number_of_addresses = 32
  # create_gateway = var.create_gateway
  # public_gateway_name_prefix = var.public_gateway_name_prefix
  # floating_ip = var.floating_ip
  # gateway_tags = var.gateway_tags

}
