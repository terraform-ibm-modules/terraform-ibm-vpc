##############################################################################
# VPC Configuration
# Copyright 2020 IBM
##############################################################################

provider ibm {
  region = var.region
}

data ibm_resource_group resource_group {
  name = var.resource_group != null ? var.resource_group : "default"
}

module vpc {
  source                              = "../../modules/vpc"
  region                              = var.region
  vpc_name                            = var.vpc_name
  prefix                              = var.prefix
  resource_group_id                   = data.ibm_resource_group.resource_group.id
  classic_access                      = var.classic_access
  auto_prefix_management              = var.auto_prefix_management
  default_network_acl_name            = var.default_network_acl_name
  default_security_group_name         = var.default_security_group_name
  default_routing_table_name          = var.default_routing_table_name
  tags                                = var.tags
  address_prefixes                    = var.address_prefixes
  create_subnets_for_address_prefixes = var.create_subnets_for_address_prefixes
  acl_id                              = var.acl_id
  create_public_gateway               = var.create_public_gateway
}

##############################################################################
