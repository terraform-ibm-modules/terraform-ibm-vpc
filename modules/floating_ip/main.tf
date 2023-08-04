##############################################################################
# Floating IP Resource
# Copyright 2020 IBM
##############################################################################

resource ibm_is_floating_ip fip {
  name           = var.name
  resource_group = var.resource_group_id
  zone           = var.target == null ? var.zone : null
  target         = var.zone != null ? null : var.target
  tags           = var.tags
}

##############################################################################