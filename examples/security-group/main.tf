#####################################################
# Security group Configuration
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

module "security_group" {
  source = "terraform-ibm-modules/vpc/ibm//modules/security-group"

  name                       = var.name
  vpc_id                     = data.ibm_is_vpc.testacc_vpc.id
  resource_group_id          = data.ibm_resource_group.resource_group.id
}