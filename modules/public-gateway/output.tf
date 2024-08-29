#####################################################
# Public Gateway Resource Output
# Copyright 2020 IBM
#####################################################

output "public_gateway_id" {
  description = "The ID of the Public Gateway"
  value       = ibm_is_public_gateway.pgw.id
}