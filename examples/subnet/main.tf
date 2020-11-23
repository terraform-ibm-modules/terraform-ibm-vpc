#####################################################
# Subnet Configuration Example
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

module "subnet" {
  source = ".terraform-ibm-modules/vpc/ibm//modules/subnet"

  name                       = var.name
  vpc_id                     = data.ibm_is_vpc.testacc_vpc.id
  resource_group_id          = data.ibm_resource_group.resource_group.id
  location                   = var.location
  ip_range                   = (var.ip_range != null ? var.ip_range : null)
  number_of_addresses        = (var.number_of_addresses != null ? var.number_of_addresses : null)
  subnet_access_control_list = (var.subnet_access_control_list != null ? var.subnet_access_control_list : null)
  public_gateway             = (var.public_gateway != null ? var.public_gateway : null)
}