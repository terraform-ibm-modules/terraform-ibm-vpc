#####################################################
# Instance
# Copyright 2020 IBM
#####################################################

output "instance_ids" {
  description = "The ID of the Instances"
  value       = ibm_is_instance.instances[0].id
}

output "primary_network_interfaces" {
  description = "The primary_network_interface of the Instances"
  value       = [for ins in ibm_is_instance.instances : [for interface in ins.var.primary_network_interface : interface.id]]
}
