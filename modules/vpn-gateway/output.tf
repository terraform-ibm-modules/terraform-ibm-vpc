#####################################################
# VPN Gateway Output
# Copyright 2020 IBM
#####################################################

output "vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = ibm_is_vpn_gateway.vpngw.*.id
}

output "vpn_gateway_connections" {
  description = "The VPN Gateway Connections"
  value       = ibm_is_vpn_gateway_connection.vpngw_connections
}