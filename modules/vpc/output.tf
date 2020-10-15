#####################################################
# VPC
# Copyright 2020 IBM
#####################################################

output "vpc_id" {
  description = "The ID of the vpc"
  value       = ibm_is_vpc.testacc_vpc.id
}