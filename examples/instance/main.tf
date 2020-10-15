#####################################################
# Instance Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_is_vpc" "testacc_vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "instance" {
  source = "../../modules/instance"

  name                      = var.name
  vpc_id                    = data.ibm_is_vpc.testacc_vpc.id
  resource_group_id         = data.ibm_resource_group.resource_group.id
  location                  = var.location
  image                     = var.image
  profile                   = var.profile
  ssh_keys                  = var.ssh_keys
  primary_network_interface = var.primary_network_interface
  user_data                 = (var.user_data != null ? var.user_data : null)
  boot_volume               = (var.boot_volume != null ? var.boot_volume : null)
  network_interfaces        = (var.network_interfaces != null ? var.network_interfaces : null)
  data_volumes              = (var.data_volumes != null ? var.data_volumes : [])
  tags                      = (var.tags != null ? var.tags : [])
}