#####################################################
# VPC Block Storage Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_volume" "testacc_volume" {
  name           = var.name
  resource_group = var.resource_group_id
  zone           = var.location
  profile        = var.volume_profile
  iops           = var.iops
  capacity       = var.size
  encryption_key = var.encryption
  tags           = var.tags
}