#####################################################
# Network ACL
# Copyright 2020 IBM
#####################################################

output "network_acl_id" {
  description = "The ID of the Network ACL"
  value       = ibm_is_network_acl.nwacl.id
}
