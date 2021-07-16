#####################################################
# Public Gateway Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_public_gateway" "pgw" {
  name           = var.name
  resource_group = var.resource_group_id
  vpc            = var.vpc_id
  zone           = var.location
  floating_ip    = (length(var.floating_ip) == 1 ? var.floating_ip : {})
  tags           = var.tags
}