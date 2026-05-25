#####################################################
# Network ACL Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_network_acl" "nwacl" {
  name           = var.name
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
  tags           = var.tags

  # Create ACL rules
  dynamic "rules" {
    for_each = (var.rules != null ? var.rules : [])
    content {
      name        = rules.value.name
      action      = rules.value.action
      source      = rules.value.source
      destination = rules.value.destination
      direction   = rules.value.direction

      protocol        = rules.value.protocol
      port_min        = rules.value.port_min
      port_max        = rules.value.port_max
      source_port_min = rules.value.source_port_min
      source_port_max = rules.value.source_port_max
      type            = rules.value.type
      code            = rules.value.code
    }
  }
}
