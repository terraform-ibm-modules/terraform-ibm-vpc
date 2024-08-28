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

      dynamic "icmp" {
        for_each = lookup(rules.value, "icmp") == null ? [] : [rules.value.icmp]
        content {
          code = icmp.value.code
          type = icmp.value.type
        }
      }
      dynamic "tcp" {
        for_each = lookup(rules.value, "tcp") == null ? [] : [rules.value.tcp]
        content {
          port_min        = lookup(tcp.value, "port_min", 1)
          port_max        = lookup(tcp.value, "port_max", 65535)
          source_port_min = lookup(tcp.value, "port_min", 1)
          source_port_max = lookup(tcp.value, "port_max", 65535)
        }
      }
      dynamic "udp" {
        for_each = lookup(rules.value, "udp") == null ? [] : [rules.value.udp]
        content {
          port_min        = lookup(udp.value, "port_min", 1)
          port_max        = lookup(udp.value, "port_max", 65535)
          source_port_min = lookup(tcp.value, "port_min", 1)
          source_port_max = lookup(tcp.value, "port_max", 65535)
        }
      }
    }
  }
}
