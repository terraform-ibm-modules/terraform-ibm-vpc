#####################################################
# VPN Gateway Configuration
# Copyright 2020 IBM
#####################################################

resource "ibm_is_vpn_gateway" "vpngw" {
  count          = var.create_vpn_gateway ? 1 : 0
  name           = var.name
  resource_group = var.resource_group_id
  subnet         = (var.subnet != null ? var.subnet : null)
  tags           = var.tags
}

resource "ibm_is_vpn_gateway_connection" "vpngw_connections" {
  for_each       = { for c in var.connections : c.name => c }
  name           = each.key
  vpn_gateway    = var.create_vpn_gateway ? ibm_is_vpn_gateway.vpngw[0].id : var.vpn_gateway
  peer_address   = each.value["peer_address"]
  preshared_key  = each.value["preshared_key"]
  local_cidrs    = each.value["local_cidrs"]
  peer_cidrs     = each.value["peer_cidrs"]
  admin_state_up = lookup(each.value, "admin_state_up", null)
  action         = lookup(each.value, "action", null)
  interval       = lookup(each.value, "interval", null)
  timeout        = lookup(each.value, "timeout", null)
  ike_policy     = lookup(each.value, "ike_policy", null)
  ipsec_policy   = lookup(each.value, "ipsec_policy", null)
}
