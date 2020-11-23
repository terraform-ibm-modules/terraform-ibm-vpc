#####################################################
# VPC Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "vpc" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpc"

  name                      = var.name
  resource_group_id         = data.ibm_resource_group.resource_group.id
  classic_access            = (var.classic_access != null ? var.classic_access : false)
  default_address_prefix    = (var.default_address_prefix != null ? var.default_address_prefix : "auto")
  tags                      = (var.tags != null ? var.tags : [])
}