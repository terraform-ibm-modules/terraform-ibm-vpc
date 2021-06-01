#####################################################
# Subnet Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "subnet" {
  source = "../../modules/subnet"

  name                       = var.name
  vpc_id                     = data.ibm_is_vpc.vpc.id
  resource_group_id          = data.ibm_resource_group.resource_group.id
  location                   = var.location
  ip_range                   = var.ip_range
  number_of_addresses        = var.number_of_addresses
  subnet_access_control_list = var.subnet_access_control_list
  public_gateway             = var.public_gateway
  routing_table              = var.routing_table
}