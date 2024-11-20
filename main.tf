/********************************************************************
VPC
*********************************************************************/

module "vpc" {
  source                      = "./modules/vpc"
  create_vpc                  = var.create_vpc
  vpc_name                    = var.vpc_name
  resource_group_id           = var.resource_group_id
  default_address_prefix      = var.auto_assign_address_prefix ? "auto" : "manual"
  default_network_acl_name    = var.default_network_acl_name
  default_security_group_name = var.default_security_group_name
  default_routing_table_name  = var.default_routing_table_name
  vpc_tags                    = var.vpc_tags
  address_prefixes            = var.address_prefixes
  locations                   = var.locations
  subnet_name_prefix          = var.subnet_name_prefix
  number_of_addresses         = var.number_of_addresses
  vpc                         = var.existing_vpc_name
  create_gateway              = var.create_gateway
  public_gateway_name_prefix  = var.public_gateway_name_prefix
  floating_ip                 = var.floating_ip
  gateway_tags                = var.gateway_tags
  clean_default_sg_acl        = var.clean_default_sg_acl
}
