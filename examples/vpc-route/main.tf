#####################################################
# VPC Route Module Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_is_vpc" "testacc_vpc" {
  name = var.vpc
}

module "vpc-route" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpc-route"

  name             = var.name
  vpc_id           = data.ibm_is_vpc.testacc_vpc.id
  location         = var.location
  destination_cidr = var.destination_cidr
  next_hop         = var.next_hop
}