#####################################################
# VPN Gateway Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  rules = [
    for r in var.connections : {
      name           = r.name
      peer_address   = r.peer_address
      preshared_key  = r.preshared_key
      local_cidrs    = r.local_cidrs
      peer_cidrs     = r.peer_cidrs
      admin_state_up = lookup(r, "admin_state_up", null)
      action         = lookup(r, "action", null)
      interval       = lookup(r, "interval", null)
      timeout        = lookup(r, "timeout", null)
      ike_policy     = lookup(r, "ike_policy", null)
      ipsec_policy   = lookup(r, "ipsec_policy", null)
    }
  ]
}

module "vpn_gateway" {
  // source = "terraform-ibm-modules/vpc/ibm//modules/vpn-gateway"
  source = "../../modules/vpn-gateway"

  create_vpn_gateway = var.create_vpn_gateway
  name               = var.name
  resource_group_id  = data.ibm_resource_group.resource_group.id
  subnet             = var.subnet
  tags               = var.tags
  vpn_gateway        = var.vpn_gateway
  connections        = var.connections
}