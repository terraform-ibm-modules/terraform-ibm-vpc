########################################################################################################################
# Outputs
########################################################################################################################
output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Resource group ID"
  value       = module.resource_group.resource_group_id
}


output "vpc" {
  description = "Information of newly created or existing VPC instace."
  value       = module.vpc.vpc
}

output "address_prefix" {
  description = "Map of address prefix created"
  value       = module.vpc.address_prefix
}

output "subnets" {
  description = "Map of subnets created."
  value       = module.vpc.subnets
}

output "network_acl" {
  description = "Map of network ACLs created."
  value       = module.vpc.network_acl
}

output "default_security_group" {
  description = "Map of default security group created."
  value       = module.vpc.default_security_group
}
