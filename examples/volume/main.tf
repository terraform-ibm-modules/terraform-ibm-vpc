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
  // source = "terraform-ibm-modules/vpc/ibm//modules/volume"
  source = "../../modules/volume"

  name              = var.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.location
  volume_profile    = var.volume_profile
  iops              = var.iops
  size              = var.size
  encryption        = var.encryption
  tags              = var.tags
}