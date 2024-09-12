#####################################################
# SUBNET
# Copyright 2020 IBM
#####################################################

output "subnet_id" {
  description = "The ID of the subnet"
  value       = ibm_is_subnet.subnet.id
}

output "subnet_ipv4_cidr" {
  description = "IPV4 subnet CIDR block"
  value       = ibm_is_subnet.subnet.ipv4_cidr_block
}
