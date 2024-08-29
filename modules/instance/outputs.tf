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
  value       = [for ins in ibm_is_instance.instances : ins.primary_network_interface.*.id]
}
