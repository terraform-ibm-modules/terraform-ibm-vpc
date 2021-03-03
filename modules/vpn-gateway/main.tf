#####################################################
# VPN Gateway Configuration
# Copyright 2020 IBM
#####################################################

resource "ibm_is_vpn_gateway" "testacc_vpngw" {
  name           = var.name
  resource_group = var.resource_group_id
  subnet         = (var.subnet != null ? var.subnet : null)
  tags           = (var.tags != null ? var.tags : [])
}