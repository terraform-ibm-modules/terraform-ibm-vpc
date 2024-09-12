#####################################################
# VPN Gateway Outputs
# Copyright 2020 IBM
#####################################################

output "vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = ibm_is_vpn_gateway.vpngw[0].id
}

output "vpn_gateway_public_ip" {
  description = "The public IP address assigned to the VPN gateway"
  value       = var.create_vpn_gateway ? ibm_is_vpn_gateway.vpngw[0].public_ip_address : null
}

output "vpn_gateway_connections" {
  description = "The VPN Gateway Connections"
  value       = [for connection in ibm_is_vpn_gateway_connection.vpngw_connections : connection.id]
}
