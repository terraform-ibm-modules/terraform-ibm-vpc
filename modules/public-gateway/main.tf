#####################################################
# Public Gateway Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_public_gateway" "testacc_pgw" {
  name           = var.name
  resource_group = var.resource_group_id
  vpc            = var.vpc_id
  zone           = var.location
  floating_ip    = var.floating_ip
  tags           = var.tags
}