#####################################################
# VPC Resource Configuration
# Copyright 2020 IBM
#####################################################

data "ibm_is_vpc" "vpc_ds" {
  count = var.create_vpc ? 0 : 1
  name  = var.vpc
}

resource "ibm_is_vpc" "vpc" {
  count                       = var.create_vpc ? 1 : 0
  name                        = var.vpc_name
  resource_group              = var.resource_group_id
  address_prefix_management   = var.default_address_prefix
  default_network_acl_name    = var.default_network_acl_name
  default_security_group_name = var.default_security_group_name
  default_routing_table_name  = var.default_routing_table_name
  tags                        = var.vpc_tags
  no_sg_acl_rules             = var.clean_default_sg_acl
}

#####################################################
# Create Prefixes
#####################################################

resource "ibm_is_vpc_address_prefix" "vpc_address_prefixes" {
  for_each = { for r in var.address_prefixes : r.name => r }
  name     = each.value["name"]
  vpc      = var.create_vpc ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.vpc_ds[0].id
  zone     = each.value["location"]
  cidr     = each.value["ip_range"]
}

#####################################################
# Create Subnets
#####################################################

resource "ibm_is_subnet" "subnets" {
  count                    = length(var.locations)
  name                     = "${var.subnet_name_prefix}-${count.index}"
  resource_group           = var.resource_group_id
  vpc                      = var.create_vpc ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.vpc_ds[0].id
  zone                     = var.locations[count.index]
  total_ipv4_address_count = var.number_of_addresses
  public_gateway           = (var.create_gateway ? ibm_is_public_gateway.pgws[count.index].id : null)
}

#####################################################
# Create Public Gateways
#####################################################

resource "ibm_is_public_gateway" "pgws" {
  count          = var.create_gateway ? length(var.locations) : 0
  name           = "${var.public_gateway_name_prefix}-${count.index}"
  resource_group = var.resource_group_id
  vpc            = var.create_vpc ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.vpc_ds[0].id
  zone           = var.locations[count.index]
  floating_ip    = (length(var.floating_ip) == 1 ? var.floating_ip : {})
  tags           = var.gateway_tags
}
