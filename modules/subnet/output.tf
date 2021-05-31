#####################################################
# SUBNET
# Copyright 2020 IBM
#####################################################

output "subnet_id" {
  description = "The ID of the subnet"
  value       = ibm_is_subnet.subnet.id
}