#####################################################
# VPC Route Configuration
# Copyright 2020 IBM
#####################################################


resource "ibm_is_vpc_route" "testacc_vpc_route" {
  name        = var.name
  vpc         = var.vpc_id
  zone        = var.location
  destination = var.destination_cidr
  next_hop    = var.next_hop
}