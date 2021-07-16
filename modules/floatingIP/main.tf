#####################################################
# Floating IP Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_floating_ip" "fip" {
  name           = var.name
  resource_group = var.resource_group_id
  zone           = (var.location != null && var.target == null ? var.location : null)
  target         = (var.target != null && var.location == null ? var.target : null)
  tags           = var.tags
}