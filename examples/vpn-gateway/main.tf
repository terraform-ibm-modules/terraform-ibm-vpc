#####################################################
# VPN Gateway Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "vpn_gateway" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpn-gateway"

  name              = var.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  subnet            = (var.subnet != null ? var.subnet : null)
  tags              = (var.tags != null ? var.tags : [])
}