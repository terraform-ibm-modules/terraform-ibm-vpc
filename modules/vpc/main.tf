#####################################################
# VPC Resource Configuration
# Copyright 2020 IBM
#####################################################

resource "ibm_is_vpc" "vpc" {
  count                       = var.create_vpc ? 1 : 0
  name                        = var.vpc_name
  resource_group              = var.resource_group_id
  classic_access              = (var.classic_access != null ? var.classic_access : false)
  address_prefix_management   = (var.default_address_prefix != null ? var.default_address_prefix : "auto")
  default_network_acl_name    = (var.default_network_acl_name != null ? var.default_network_acl_name : null)
  default_security_group_name = (var.default_security_group_name != null ? var.default_security_group_name : null)
  default_routing_table_name  = (var.default_routing_table_name != null ? var.default_routing_table_name : null)
  tags                        = (var.vpc_tags != null ? var.vpc_tags : [])
}

resource "ibm_is_vpc_address_prefix" "vpc_address_prefixes" {
  for_each = toset(var.address_prefixes)
  name     = each.key
  vpc      = var.create_vpc ? ibm_is_vpc.vpc[0].id : var.vpc
  zone     = each.value["location"]
  cidr     = each.value["ip_range"]
}

resource "ibm_is_subnet" "subnets" {
  count                    = length(var.locations)
  name                     = "${var.subnet_name}-${count.index}"
  resource_group           = var.resource_group_id
  vpc                      = var.create_vpc ? ibm_is_vpc.vpc[0].id : var.vpc
  zone                     = var.locations[count.index]
  total_ipv4_address_count = var.number_of_addresses
  public_gateway           = (var.create_gateway ? ibm_is_public_gateway.pgws[count.index].id : null)
}

resource "ibm_is_public_gateway" "pgws" {
  count          = var.create_gateway ? length(var.locations) : 0
  name           = "${var.public_gateway_name}-${count.index}"
  resource_group = var.resource_group_id
  vpc            = var.create_vpc ? ibm_is_vpc.vpc[0].id : var.vpc
  zone           = var.locations[count.index]
  floating_ip    = (length(var.floating_ip) == 1 ? var.floating_ip : {})
  tags           = (var.gateway_tags != null ? var.gateway_tags : [])
}