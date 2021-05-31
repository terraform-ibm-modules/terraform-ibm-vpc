#####################################################
# VPC Resource Configuration
# Copyright 2020 IBM
#####################################################

resource "ibm_is_vpc" "vpc" {
  count                     = var.create_vpc ? 1 : 0
  name                      = var.vpc_name
  resource_group            = var.resource_group_id
  classic_access            = (var.classic_access != null ? var.classic_access : false)
  address_prefix_management = (var.default_address_prefix != null ? var.default_address_prefix : "auto")
  tags                      = (var.vpc_tags != null ? var.vpc_tags : [])
}


resource "ibm_is_vpc_address_prefix" "vpc_address_prefix" {
  for_each = ibm_is_vpc.vpc[0].address_prefix_management == "manual" ? toset(var.address_prefixes) : toset([])
  name     = each.key
  vpc      = ibm_is_vpc.vpc[0].id
  zone     = each.value["location"]
  cidr     = each.value["ip_range"]
}

resource "ibm_is_subnet" "subnets" {
  count                    = length(var.locations)
  name                     = "${var.subnet_name}-${count.index}"
  resource_group           = var.resource_group_id
  vpc                      = ibm_is_vpc.vpc[0].id
  zone                     = var.locations[count.index]
  total_ipv4_address_count = var.number_of_addresses
  network_acl              = (var.subnet_access_control_list != null ? var.subnet_access_control_list : null)
  public_gateway           = (var.create_gateway ? ibm_is_public_gateway.pgws[count.index].id : null)
  routing_table            = (var.routing_table != null ? var.routing_table : null)
}

resource "ibm_is_public_gateway" "pgws" {
  count          = var.create_gateway ? length(var.locations) : 0
  name           = "${var.public_gateway_name}-${count.index}"
  resource_group = var.resource_group_id
  vpc            = ibm_is_vpc.vpc[0].id
  zone           = var.locations[count.index]
  floating_ip    = (length(var.floating_ip) == 1 ? var.floating_ip : {})
  tags           = (var.gateway_tags != null ? var.gateway_tags : [])
}