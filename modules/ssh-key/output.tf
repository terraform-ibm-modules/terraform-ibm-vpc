#####################################################
# SSH Key
# Copyright 2020 IBM
#####################################################

output "ssh_key_id" {
  description = "The ID of the ssh key"
  value       = ibm_is_ssh_key.testacc_ssh_key.id
}

output "fingerprint" {
  description = "SSH key Fingerprint info"
  value       = ibm_is_ssh_key.testacc_ssh_key.fingerprint
}