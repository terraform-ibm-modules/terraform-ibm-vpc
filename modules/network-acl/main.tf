#####################################################
# Network ACL Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_network_acl" "testacc_nwacl" {
  name           = var.name
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
  tags           = (var.tags != null ? var.tags : [])

  # Create ACL rules
  dynamic rules {
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
      // dynamic tcp {
      //   for_each = (
      //     contains(keys(rules.value), "tcp") ? [rules.value] : []
      //   )
      //   content {

      //     port_min = lookup(
      //       lookup(
      //         rules.value,
      //         "tcp"
      //       ),
      //       "port_min",
      //       1
      //     )

      //     port_max = lookup(
      //       lookup(
      //         rules.value,
      //         "tcp"
      //       ),
      //       "port_max",
      //       65535
      //     )

      //     source_port_min = lookup(
      //       lookup(
      //         rules.value,
      //         "tcp"
      //       ),
      //       "source_port_min",
      //       1
      //     )

      //     source_port_max = lookup(
      //       lookup(
      //         rules.value,
      //         "tcp"
      //       ),
      //       "source_port_max",
      //       65535
      //     )
      //   }
      // }

      // dynamic udp {
      //   for_each = (
      //     contains(keys(rules.value), "udp") ? [rules.value] : []
      //   )
      //   content {

      //     port_min = lookup(
      //       lookup(
      //         rules.value,
      //         "udp"
      //       ),
      //       "port_min",
      //       1
      //     )

      //     port_max = lookup(
      //       lookup(
      //         rules.value,
      //         "udp"
      //       ),
      //       "port_max",
      //       65535
      //     )

      //     source_port_min = lookup(
      //       lookup(
      //         rules.value,
      //         "tcp"
      //       ),
      //       "source_port_min",
      //       1
      //     )

      //     source_port_max = lookup(
      //       lookup(
      //         rules.value,
      //         "tcp"
      //       ),
      //       "source_port_max",
      //       65535
      //     )
      //   }
      // }

      // dynamic icmp {

      //   for_each = (
      //     contains(keys(rules.value), "icmp") ? [rules.value] : []
      //   )

      //   content {

      //     type = lookup(
      //       lookup(
      //         rules.value,
      //         "icmp"
      //       ),
      //       "type",
      //       null
      //     )

      //     code = lookup(
      //       lookup(
      //         rules.value,
      //         "icmp"
      //       ),
      //       "code",
      //       null
      //     )
      //   }
      // }
    }
  }
}