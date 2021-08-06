##############################################################################
# Subnet Outputs
# Copyright 2020 IBM
##############################################################################

output ids {
  description = "The IDs of the subnets"
  value       = local.all_subnets.*.id
}

output detail_list {
  description = "A list of subnets containing names, CIDR blocks, and zones."
  value       = {
    for zone_name in distinct(local.all_subnets.*.zone):
    zone_name => {
      for subnet in local.all_subnets: 
      subnet.name => {
        id = subnet.id
        cidr = subnet.ipv4_cidr_block 
      } if subnet.zone == zone_name
    }
  }
}

output zone_list {
  description = "A list containing subnet IDs and subnet zones"
  value       = [
    for subnet in local.all_subnets: {
      name = subnet.name
      id   = subnet.id
      zone = subnet.zone
      cidr = subnet.ipv4_cidr_block
    }
  ]
}

##############################################################################


##############################################################################
# Address Prefix Outputs
##############################################################################

output address_prefixes {
  description = "The Address Prefixes added to the VPC"
  value       = [for prefix in ibm_is_vpc_address_prefix.subnet_prefix : prefix.id]
}

output address_prefixes_cidr {
  description = "The Address Prefix CIDRs of the VPC"
  value       = [for prefix in ibm_is_vpc_address_prefix.subnet_prefix : prefix.cidr]
}

##############################################################################