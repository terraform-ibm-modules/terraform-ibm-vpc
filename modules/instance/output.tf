##############################################################################
# Instance
# Copyright 2020 IBM
##############################################################################

output id {
  description = "The ID of the Instances"
  value       = ibm_is_instance.instances.*.id
}

output primary_network_interfaces {
  description = "The primary_network_interface of the Instances"
  value       = [for ins in ibm_is_instance.instances : ins.primary_network_interface.*.id]
}

output zone {
  description = "Zone where the Instances are provisioned"
  value       = var.zone
}
##############################################################################