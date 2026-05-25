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
  protocol = each.value.protocol
  port_min = each.value.port_min
  port_max = each.value.port_max
  type     = each.value.type
  code     = each.value.code
}
