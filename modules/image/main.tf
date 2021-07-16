#####################################################
# Image Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_image" "image" {
  name               = var.name
  href               = var.href
  operating_system   = var.operating_system
  resource_group     = var.resource_group_id
  encrypted_data_key = (var.encrypted_data_key != null ? var.encrypted_data_key : null)
  encryption_key     = (var.encryption_key != null ? var.encryption_key : null)
  tags               = var.tags
}