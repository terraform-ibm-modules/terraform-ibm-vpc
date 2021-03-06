#####################################################
# VPC
# Copyright 2020 IBM
#####################################################

output "vpc_id" {
  description = "The ID of the vpc"
  value       = ibm_is_vpc.vpc.*.id
}

output "vpc_default_security_group" {
  description = "The ID of the vpc default security group"
  value       = ibm_is_vpc.vpc.*.default_security_group
}

output "vpc_default_network_acl" {
  description = "The ID of the vpc default network acl"
  value       = ibm_is_vpc.vpc.*.default_network_acl
}

output "vpc_default_routing_table" {
  description = "The ID of the vpc default Routing Table"
  value       = ibm_is_vpc.vpc.*.default_routing_table
}

output "vpc_address_prefixes" {
  description = "The Address Prefixes of the VPC"
  value       = [for prefix in ibm_is_vpc_address_prefix.vpc_address_prefixes : prefix.id]
}

output "vpc_address_prefixes_cidr" {
  description = "The Address Prefix CIDRs of the VPC"
  value       = [for prefix in ibm_is_vpc_address_prefix.vpc_address_prefixes : prefix.cidr]
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = ibm_is_subnet.subnets.*.id
}

output "public_gateway_ids" {
  description = "The IDs of the Public Gateways"
  value       = ibm_is_public_gateway.pgws.*.id
}