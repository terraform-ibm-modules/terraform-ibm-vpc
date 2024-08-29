#####################################################
# Security Group outputs configuration
# Copyright 2020 IBM
#####################################################

output "security_group_id" {
  description = "The ID of the Security group"
  value       = module.security_group.security_group_id
}

output "security_group_rules" {
  description = "All the IDs of Security group Rules"
  value       = module.security_group.security_group_rules
}
