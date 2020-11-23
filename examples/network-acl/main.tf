#####################################################
# Network ACL Configuration
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

module "network_acl" {
  source = "../../modules/network-acl"

  name              = var.name
  vpc_id            = data.ibm_is_vpc.testacc_vpc.id
  resource_group_id = data.ibm_resource_group.resource_group.id
  rules             = (var.rules != null ? var.rules : [])
}