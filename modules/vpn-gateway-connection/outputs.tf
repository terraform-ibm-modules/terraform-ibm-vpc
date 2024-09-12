#####################################################
# VPN Gateway Connection
# Copyright 2020 IBM
#####################################################

output "vpn_gateway_connection_id" {
  description = "The ID of the VPN Gateway Connection"
  value       = ibm_is_vpn_gateway_connection.vpngw_connection.id
}
