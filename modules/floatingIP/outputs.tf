#####################################################
# Floating IP
# Copyright 2020 IBM
#####################################################

output "floating_ip_id" {
  description = "The ID of the Floating IP"
  value       = ibm_is_floating_ip.fip.id
}
