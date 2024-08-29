#####################################################
# Virtual Private Endpoint Resources
# Copyright 2020 IBM
#####################################################

output "endpoint_gateway_id" {
  description = "The ID of the endpoint gateway"
  value       = var.create_endpoint_gateway ? ibm_is_virtual_endpoint_gateway.endpoint_gateway.0.id : data.ibm_is_virtual_endpoint_gateway.vpe_ds.0.id
}

output "endpoint_gateway_target" {
  description = "The ID of the endpoint gateway target"
  value       = var.create_endpoint_gateway ? ibm_is_virtual_endpoint_gateway.endpoint_gateway.0.target : data.ibm_is_virtual_endpoint_gateway.vpe_ds.0.target
}

output "endpoint_gateway_ips" {
  description = "The ID of the endpoint gateway IPs"
  value       = var.create_endpoint_gateway ? [for ip in ibm_is_virtual_endpoint_gateway.endpoint_gateway.0.ips : ip.id] : [for ip in data.ibm_is_virtual_endpoint_gateway.vpe_ds.0.ips : ip.id]
}

output "gateway_reserved_ips" {
  description = "All the Gateway Reserved IPs"
  value       = [for ip in ibm_is_virtual_endpoint_gateway_ip.virtual_endpoint_gateway_ips : ip.id]
}