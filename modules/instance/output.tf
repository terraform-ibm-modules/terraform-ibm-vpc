#####################################################
# Instance
# Copyright 2020 IBM
#####################################################

output "instance_ids" {
  description = "The ID of the Instances"
  value       = ibm_is_instance.instances.*.id
}

output "primary_network_interfaces" {
  description = "The primary_network_interface of the Instances"
  value       = ibm_is_instance.instances.*.primary_network_interface
}