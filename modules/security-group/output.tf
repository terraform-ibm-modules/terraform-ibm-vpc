#####################################################
# Security Group
# Copyright 2020 IBM
#####################################################

output "security_group_id" {
  description = "The ID of the Security group"
  value       = ibm_is_security_group.testacc_sg.id
}