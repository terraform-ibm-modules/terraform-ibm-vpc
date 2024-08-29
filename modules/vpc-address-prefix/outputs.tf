#####################################################
# VPC Address Prefix
# Copyright 2020 IBM
#####################################################

output "vpc_address_prefix_id" {
  description = "The ID of the vpc Address Prefix"
  value       = ibm_is_vpc_address_prefix.vpc_address_prefix.id
}
