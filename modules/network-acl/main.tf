#####################################################
# Network ACL Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_network_acl" "testacc_nwacl" {
  name           = var.name
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
  
  dynamic rules {
    for_each = var.rules
    content {
      name        = rules.value.name
      action      = rules.value.action
      source      = rules.value.source
      destination = rules.value.destination
      direction   = rules.value.direction
      icmp        = rules.value.icmp
      tcp         = rules.value.tcp
      udp         = rules.value.udp
    }
  }
}