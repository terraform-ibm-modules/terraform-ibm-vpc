#####################################################
# Security Group
# Copyright 2020 IBM
#####################################################

output "security_group_id" {
  description = "The ID of the Security group"
  value       = ibm_is_security_group.sg.*.id
}

output "security_group_rules" {
  description = "All the Security group Rules"
  value       = [for rule in ibm_is_security_group_rule.sg_rules : rule.id]
}