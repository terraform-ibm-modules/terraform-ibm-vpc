#####################################################
# VPC
# Copyright 2020 IBM
#####################################################

output "vpc_id" {
  description = "The ID of the vpc"
  value       = ibm_is_vpc.testacc_vpc.id
}

output "vpc_default_security_group" {
  description = "The ID of the vpc default security group"
  value       = ibm_is_vpc.testacc_vpc.default_security_group
}

output "vpc_default_network_acl" {
  description = "The ID of the vpc default network acl"
  value       = ibm_is_vpc.testacc_vpc.default_network_acl
}

output "vpc_default_routing_table" {
  description = "The ID of the vpc default Routing Table"
  value       = ibm_is_vpc.testacc_vpc.default_routing_table
}