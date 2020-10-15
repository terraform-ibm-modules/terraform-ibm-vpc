#####################################################
# Instance
# Copyright 2020 IBM
#####################################################

output "instance_id" {
  description = "The ID of the Instance"
  value       = ibm_is_instance.testacc_instance.id
}