#####################################################
# VPC Block Storage Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_volume" "volume" {
  name           = var.name
  resource_group = var.resource_group_id
  zone           = var.location
  profile        = var.volume_profile
  iops           = (var.volume_profile == "custom" && var.iops != null ? var.iops : null)
  capacity       = (var.size != null ? var.size : null)
  encryption_key = (var.encryption != null ? var.encryption : null)
  tags           = var.tags
}