#####################################################
# VPN Gateway Outputs Configuration
# Copyright 2020 IBM
#####################################################

output "vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = module.vpn_gateway.vpn_gateway_id
}

output "vpn_gateway_public_ip" {
  description = "The public IP address assigned to the VPN gateway"
  value       = module.vpn_gateway.vpn_gateway_public_ip
}

output "vpn_gateway_connections" {
  description = "The VPN Gateway Connections"
  value       = module.vpn_gateway.vpn_gateway_connections
}