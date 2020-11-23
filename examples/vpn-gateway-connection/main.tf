#####################################################
# VPN Gateway Connection Module Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "vpc_gateway_connection" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpn-gateway-connection"

  vpn_gateway_connection_name = var.vpn_gateway_connection_name
  vpn_gateway_id              = var.vpn_gateway_id
  peer_gateway_address        = var.peer_gateway_address
  preshared_key               = var.preshared_key
  local_cidrs                 = var.local_cidrs
  peer_cidrs                  = var.peer_cidrs
  admin_state_up              = (var.admin_state_up != null ? var.admin_state_up : null)
  action                      = (var.action != null ? var.action : null)
  interval                    = (var.interval != null ? var.interval : null)
  timeout                     = (var.timeout != null ? var.timeout : null)
  ike_policy                  = (var.ike_policy != null ? var.ike_policy : null)
  ipsec_policy                = (var.ipsec_policy != null ? var.ipsec_policy : null)
}