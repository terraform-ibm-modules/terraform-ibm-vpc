########################################################################################################################
# Outputs
########################################################################################################################

output "vpc" {
  description = "Information of newly created or existing VPC instace."
  value       = var.create_vpc ? ibm_is_vpc.vpc[0] : data.ibm_is_vpc.vpc[0]
}

output "address_prefix" {
  description = "Map of address prefix created."
  value       = ibm_is_vpc_address_prefix.vpc_address_prefixes
}

output "subnets" {
  description = "Map of subnets created."
  value       = ibm_is_subnet.subnet
}

output "network_acl" {
  description = "Map of network ACLs created."
  value       = ibm_is_network_acl.network_acl
}

output "default_security_group" {
  description = "Map of default security group created."
  value       = ibm_is_security_group_rule.default_vpc_rule
}
