#####################################################
# Security Group
# Copyright 2020 IBM
#####################################################

output "security_group_id" {
  description = "The ID of the Security group"
  value       = var.create_security_group ? ibm_is_security_group.sg.0.id : data.ibm_is_security_group.sg_ds.0.id
}

output "security_group_rules" {
  description = "All the IDs of Security group Rules"
  value       = [for rule in ibm_is_security_group_rule.sg_rules : rule.id]
}