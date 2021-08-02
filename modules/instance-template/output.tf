#####################################################
# Instance Template Module Outputs
# Copyright 2020 IBM
#####################################################

output "instance_template_id" {
  description = "The ID of the Instance Template"
  value       = ibm_is_instance_template.ins_template.id
}

output "primary_network_interfaces" {
  description = "The primary_network_interface of the Instances"
  value       = [for ins in ibm_is_instance_template.ins_template : ins.primary_network_interface.*.id]
}