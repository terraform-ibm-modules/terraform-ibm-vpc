#####################################################
# VPC Resource Configuration
# Copyright 2020 IBM
#####################################################

resource "ibm_is_vpc" "testacc_vpc" {
  name                      = var.name
  resource_group            = var.resource_group_id
  classic_access            = (var.classic_access != null ? var.classic_access : false)
  address_prefix_management = (var.default_address_prefix != null ? var.default_address_prefix : "auto")
  tags                      = (var.tags != null ? var.tags : [])
}