#####################################################
# VPC Resource Configuration
# Copyright 2020 IBM
#####################################################

resource "ibm_is_vpc" "testacc_vpc" {
  name                      = var.name
  resource_group            = var.resource_group_id
  classic_access            = var.classic_access
  address_prefix_management = var.default_address_prefix
  tags                      = var.tags
}