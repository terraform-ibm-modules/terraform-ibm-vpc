##############################################################################
# VPC Outputs
# Copyright 2020 IBM
##############################################################################

output id {
  description = "The ID of the vpc"
  value       = local.vpc_id
}

output default_security_group_id {
  description = "The ID of the vpc default security group"
  value       = local.default_security_group_id
}

output default_acl_id {
  description = "The ID of the vpc default network acl"
  value       = local.default_acl_id
}

output default_routing_table_id {
  description = "The ID of the vpc default Routing Table"
  value       = local.default_routing_table_id
}

##############################################################################


##############################################################################
# Address Prefix Outputs
##############################################################################

output address_prefixes {
  description = "The Address Prefixes of the VPC"
  value       = [for prefix in ibm_is_vpc_address_prefix.address_prefixes : prefix.id]
}

output address_prefixes_cidr {
  description = "The Address Prefix CIDRs of the VPC"
  value       = [for prefix in ibm_is_vpc_address_prefix.address_prefixes : prefix.cidr]
}

##############################################################################


##############################################################################
# Subnet Outputs
##############################################################################

output subnet_ids {
  description = "The IDs of the subnets"
  value       = ibm_is_subnet.subnet.*.id
}

output subnet_detail_list {
  description = "A list of subnets containing names, CIDR blocks, and zones."
  value       = {
    for zone_name in distinct(local.subnet_list_from_object.*.zone_name):
    zone_name => {
      for subnet in ibm_is_subnet.subnet: 
      subnet.name => {
        id = subnet.id
        cidr = subnet.ipv4_cidr_block 
      } if subnet.zone == zone_name
    }
  }
}

output subnet_zone_list {
  description = "A list containing cluster subnet IDs and subnet zones"
  value       = [
    for subnet in ibm_is_subnet.subnet: {
      name = subnet.name
      id   = subnet.id
      zone = subnet.zone
      cidr = subnet.ipv4_cidr_block
    }
  ]
}

##############################################################################


##############################################################################
# Public Gateway Outputs
##############################################################################

output public_gateway_ids {
  description = "The IDs of the Public Gateways"
  value       = ibm_is_public_gateway.public_gateway.*.id
}

##############################################################################