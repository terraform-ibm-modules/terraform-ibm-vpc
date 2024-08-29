#####################################################
# VPC Block Storage
# Copyright 2020 IBM
#####################################################

output "volume_id" {
  description = "The ID of the volume"
  value       = ibm_is_volume.volume.id
}