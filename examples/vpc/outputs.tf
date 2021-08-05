##############################################################################
# VPC Outputs
# Copyright 2020 IBM
##############################################################################

output id {
  description = "The ID of the vpc"
  value       = module.vpc.vpc_id
}

output default_security_group_id {
  description = "The ID of the vpc default security group"
  value       = module.vpc.default_security_group_id
}

output default_acl_id {
  description = "The ID of the vpc default network acl"
  value       = module.vpc.default_acl_id
}

output default_routing_table_id {
  description = "The ID of the vpc default Routing Table"
  value       = module.vpc.default_routing_table_id
}

##############################################################################


##############################################################################
# Address Prefix Outputs
##############################################################################

output address_prefixes {
  description = "The Address Prefixes of the VPC"
  value       = module.vpc.address_prefixes
}

output address_prefixes_cidr {
  description = "The Address Prefix CIDRs of the VPC"
  value       = module.vpc.address_prefixes_cidr
}

##############################################################################


##############################################################################
# Subnet Outputs
##############################################################################

output subnet_ids {
  description = "The IDs of the subnets"
  value       = module.vpc.subnet_ids
}

output subnet_detail_list {
  description = "A list of subnets containing names, CIDR blocks, and zones."
  value       = module.vpc.subnet_detail_list
}

output subnet_zone_list {
  description = "A list containing cluster subnet IDs and subnet zones"
  value       = module.vpc.subnet_zone_list
}

##############################################################################


##############################################################################
# Public Gateway Outputs
##############################################################################

output public_gateway_ids {
  description = "The IDs of the Public Gateways"
  value       = module.vpc.public_gateway_ids
}

##############################################################################