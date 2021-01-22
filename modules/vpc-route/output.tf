#####################################################
# VPC Route
# Copyright 2020 IBM
#####################################################

output "vpc_route_id" {
  description = "The ID of the vpc Route"
  value       = ibm_is_vpc_route.testacc_vpc_route.id
}