#####################################################
# VPC Block Storage Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "volume" {
  source = "../../modules/volume"

  name              = var.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.location
  volume_profile    = var.volume_profile
  iops              = (var.volume_profile == "custom" && var.iops != null ? var.iops : null)
  size              = (var.size != null ? var.size : null)
  encryption        = (var.encryption != null ? var.encryption : null)
  tags              = (var.tags != null ? var.tags : [])
}