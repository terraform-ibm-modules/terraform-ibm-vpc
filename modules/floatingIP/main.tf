#####################################################
# Floating IP Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_floating_ip" "testacc_fip" {
  name           = var.name
  resource_group = var.resource_group_id
  zone           = (var.location != null ? var.location : null)
  target         = (var.target != null ? var.target : null)
  tags           = (var.tags != null ? var.tags : [])
}