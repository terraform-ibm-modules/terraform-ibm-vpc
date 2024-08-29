#####################################################
# Image
# Copyright 2020 IBM
#####################################################

output "image_id" {
  description = "The ID of the Image"
  value       = ibm_is_image.image.id
}