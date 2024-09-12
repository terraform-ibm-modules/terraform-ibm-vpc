#####################################################
# Security Group Resource
# Copyright 2020 IBM
#####################################################

data "ibm_is_security_group" "sg_ds" {
  count = var.create_security_group ? 0 : 1
  name  = var.security_group
}

resource "ibm_is_security_group" "sg" {
  count          = var.create_security_group ? 1 : 0
  name           = var.name
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
}


#---------------------------------------------------------
# Create security group rules resources
#---------------------------------------------------------

resource "ibm_is_security_group_rule" "sg_rules" {
  for_each   = { for r in var.security_group_rules : r.name => r }
  group      = var.create_security_group ? ibm_is_security_group.sg[0].id : data.ibm_is_security_group.sg_ds[0].id
  direction  = each.value.direction
  remote     = each.value.remote != "" ? each.value.remote : null
  ip_version = each.value.ip_version != "" ? each.value.ip_version : "ipv4"
  dynamic "icmp" {
    for_each = each.value.icmp == null ? [] : [each.value]
    content {
      type = lookup(each.value.icmp, "type", null)
      code = lookup(each.value.icmp, "code", null)
    }
  }
  dynamic "tcp" {
    for_each = each.value.tcp == null ? [] : [each.value]
    content {
      port_min = each.value.tcp.port_min
      port_max = each.value.tcp.port_max
    }
  }
  dynamic "udp" {
    for_each = each.value.udp == null ? [] : [each.value]
    content {
      port_min = each.value.udp.port_min
      port_max = each.value.udp.port_max
    }
  }
}
