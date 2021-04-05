#####################################################
# Virtual Private Endpoint Resources
# Copyright 2020 IBM
#####################################################

output "endpoint_gateway_id" {
  description = "The ID of the endpoint gateway"
  value       = ibm_is_virtual_endpoint_gateway.endpoint_gateway.*.id
}

output "gateway_reserved_ips" {
  description = "All the Gateway Reserved IPs"
  value       = ibm_is_virtual_endpoint_gateway_ip.virtual_endpoint_gateway_ips
}