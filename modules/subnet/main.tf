#####################################################
# Subnet Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_subnet" "testacc_subnet" {
  name                     = var.name
  resource_group           = var.resource_group_id
  vpc                      = var.vpc_id
  zone                     = var.location
  ipv4_cidr_block          = (var.ip_range != null && var.number_of_addresses == null ? var.ip_range : null)
  total_ipv4_address_count = (var.number_of_addresses != null && var.ip_range == null ? var.number_of_addresses : null)
  network_acl              = (var.subnet_access_control_list != null ? var.subnet_access_control_list : null)
  public_gateway           = (var.public_gateway != null ? var.public_gateway : null)
  routing_table            = (var.routing_table != null ? var.routing_table : null)
}