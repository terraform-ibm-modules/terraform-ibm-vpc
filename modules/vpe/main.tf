#####################################################
# Virtual Private Endpoint Resource
# Copyright 2020 IBM
#####################################################


data "ibm_is_virtual_endpoint_gateway" "vpe_ds" {
  count = var.create_endpoint_gateway ? 0 : 1
  name  = var.endpoint_gateway
}

#####################################################
# Create Virtual Endpoint Gateway
#####################################################

resource "ibm_is_virtual_endpoint_gateway" "endpoint_gateway" {
  count          = var.create_endpoint_gateway ? 1 : 0
  name           = var.name
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
  dynamic "target" {
    for_each = var.target
    content {
      resource_type = target.value.resource_type
      name          = (target.value.name != "" ? target.value.name : null)
      crn           = (target.value.crn != "" ? target.value.crn : null)
    }
  }
  dynamic "ips" {
    for_each = (var.ips != null ? var.ips : [])
    content {
      id     = (ips.value.id != "" ? ips.value.id : null)
      name   = (ips.value.name != "" ? ips.value.name : null)
      subnet = (ips.value.subnet != "" ? ips.value.subnet : null)
    }
  }
  tags = var.tags
}

#####################################################
# Create IPs
#####################################################

resource "ibm_is_virtual_endpoint_gateway_ip" "virtual_endpoint_gateway_ips" {
  for_each    = { for r in var.reserved_ips : r.reserved_ip => r }
  gateway     = var.create_endpoint_gateway ? ibm_is_virtual_endpoint_gateway.endpoint_gateway[0].id : data.ibm_is_virtual_endpoint_gateway.vpe_ds.0.id
  reserved_ip = each.value.reserved_ip
}
