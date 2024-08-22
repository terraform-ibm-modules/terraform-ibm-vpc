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
# COS instance
########################################################################################################################

module "vpc" {
  source                       = "../.."
  resource_group_id            = module.resource_group.resource_group_id
  vpc_name                     = var.vpc_name
  locations                    = var.locations
  network_acls                 = var.network_acls
  auto_assign_address_prefix   = false
  default_security_group_rules = var.default_security_group_rules
}
