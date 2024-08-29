#####################################################
# Virtual Private Endpoint Outputs Configuration
# Copyright 2020 IBM
#####################################################


output "endpoint_gateway_id" {
  description = "The ID of the endpoint gateway"
  value       = module.vpe.endpoint_gateway_id
}

output "endpoint_gateway_target" {
  description = "The ID of the endpoint gateway target"
  value       = module.vpe.endpoint_gateway_target
}

output "endpoint_gateway_ips" {
  description = "The ID of the endpoint gateway IPs"
  value       = module.vpe.endpoint_gateway_ips
}

output "gateway_reserved_ips" {
  description = "All the Gateway Reserved IPs"
  value       = module.vpe.gateway_reserved_ips
}
