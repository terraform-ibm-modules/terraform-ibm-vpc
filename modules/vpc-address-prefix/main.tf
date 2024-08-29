#####################################################
# VPC Address Prefix Configuration
# Copyright 2020 IBM
#####################################################


resource "ibm_is_vpc_address_prefix" "vpc_address_prefix" {
  name = var.name
  vpc  = var.vpc_id
  zone = var.location
  cidr = var.ip_range
}