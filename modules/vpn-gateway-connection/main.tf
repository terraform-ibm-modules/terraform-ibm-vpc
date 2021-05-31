#####################################################
# VPN Gateway Connection Configuration
# Copyright 2020 IBM
#####################################################


resource "ibm_is_vpn_gateway_connection" "vpngw_connection" {
  name           = var.vpn_gateway_connection_name
  vpn_gateway    = var.vpn_gateway_id
  peer_address   = var.peer_gateway_address
  preshared_key  = var.preshared_key
  local_cidrs    = var.local_cidrs
  peer_cidrs     = var.peer_cidrs
  admin_state_up = (var.admin_state_up != null ? var.admin_state_up : null)
  action         = (var.action != null ? var.action : null)
  interval       = (var.interval != null ? var.interval : null)
  timeout        = (var.timeout != null ? var.timeout : null)
  ike_policy     = (var.ike_policy != null ? var.ike_policy : null)
  ipsec_policy   = (var.ipsec_policy != null ? var.ipsec_policy : null)
}