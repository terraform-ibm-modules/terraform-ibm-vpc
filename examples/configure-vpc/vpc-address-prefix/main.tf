#####################################################
# VPC Address Prefix Module Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_is_vpc" "testacc_vpc" {
  name = var.vpc
}

module "vpc-address-prefix" {
  source = "terraform-ibm-modules/vpc/ibm//modules/configure-vpc/vpc-address-prefix"

  name     = var.name
  vpc_id   = data.ibm_is_vpc.testacc_vpc.id
  location = var.location
  ip_range = var.ip_range
}