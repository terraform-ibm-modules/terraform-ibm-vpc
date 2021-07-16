#####################################################
# VPC Outputs Configuration
# Copyright 2020 IBM
#####################################################

output "vpc_id" {
  description = "The ID of the vpc"
  value       = module.vpc.vpc_id
}

output "vpc_default_security_group" {
  description = "The ID of the vpc default security group"
  value       = module.vpc.vpc_default_security_group
}

output "vpc_default_network_acl" {
  description = "The ID of the vpc default network acl"
  value       = module.vpc.vpc_default_network_acl
}

output "vpc_default_routing_table" {
  description = "The ID of the vpc default Routing Table"
  value       = module.vpc.vpc_default_routing_table
}

output "vpc_address_prefixes" {
  description = "The Address Prefixes of the VPC"
  value       = module.vpc.vpc_address_prefixes
}

output "vpc_address_prefixes_cidr" {
  description = "The Address Prefix CIDRs of the VPC"
  value       = module.vpc.vpc_address_prefixes_cidr
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = module.vpc.subnet_ids
}

output "public_gateway_ids" {
  description = "The IDs of the Public Gateways"
  value       = module.vpc.public_gateway_ids
}