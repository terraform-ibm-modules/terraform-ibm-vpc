#####################################################
# Instance
# Copyright 2020 IBM
#####################################################

output "instance_ids" {
  description = "The ID of the Instances"
  value       = ibm_is_instance.instances[0].id
}
output "instance_data" {
  description = "Data of all the instances created."
  value       = ibm_is_instance.instances
}
