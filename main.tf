/********************************************************************
This file is used to implement the ROOT module.
*********************************************************************/

locals {
  vpc_id   = var.create_vpc ? ibm_is_vpc.vpc[0].id : var.existing_vpc_id
  vpc_name = var.create_vpc ? ibm_is_vpc.vpc[0].name : data.ibm_is_vpc.vpc[0].name
  vpc_crn  = var.create_vpc ? ibm_is_vpc.vpc[0].crn : data.ibm_is_vpc.vpc[0].crn
}

data "ibm_is_vpc" "vpc" {
  count      = var.create_vpc ? 0 : 1
  identifier = var.existing_vpc_id
}

resource "ibm_is_vpc" "vpc" {
  count                       = var.create_vpc ? 1 : 0
  name                        = var.vpc_name
  resource_group              = var.resource_group_id
  classic_access              = var.enable_classic_access
  address_prefix_management   = var.auto_assign_address_prefix ? "auto" : "manual"
  default_network_acl_name    = var.default_network_acl_name
  default_security_group_name = var.default_security_group_name
  default_routing_table_name  = var.default_routing_table_name
  no_sg_acl_rules             = var.no_sg_acl_rules
  tags                        = var.vpc_tags
}

# #####################################################
# # Create Prefixes
# #####################################################

locals {
  address_prefix = [
    for location in var.locations : {
      zone = location.zone
      name = location.address_prefix.name
      cidr = location.address_prefix.cidr
    } if location.address_prefix != null
  ]
}



resource "ibm_is_vpc_address_prefix" "vpc_address_prefixes" {
  count = length(local.address_prefix)
  name  = local.address_prefix[count.index].name
  vpc   = local.vpc_id
  zone  = local.address_prefix[count.index].zone
  cidr  = local.address_prefix[count.index].cidr
}

# #####################################################
# # Create Public Gateways
# #####################################################

locals {
  public_gateways = [
    for location in var.locations : {
      zone        = location.zone
      name        = location.public_gateway.name
      floating_ip = location.public_gateway.floating_ip
      tags        = location.public_gateway.tags
    } if location.public_gateway != null
  ]
}
resource "ibm_is_public_gateway" "public_gateway" {
  count          = length(local.public_gateways)
  name           = local.public_gateways[count.index].name
  resource_group = var.resource_group_id
  vpc            = local.vpc_id
  zone           = local.public_gateways[count.index].zone
  floating_ip    = local.public_gateways[count.index].floating_ip
  tags           = local.public_gateways[count.index].tags
}

# #####################################################
# # Create Subnets
# #####################################################

locals {
  subnet = flatten(
    [
      for index, location in var.locations : [
        for subnet in location.subnets : {
          zone            = location.zone
          name            = subnet.name
          access_tags     = subnet.access_tags
          ipv4_cidr_block = subnet.ipv4_cidr_block
          network_acl     = subnet.network_acl
          public_gateway  = subnet.attach_public_gateway ? ibm_is_public_gateway.public_gateway[index].id : null
          tags            = subnet.tags
        }
      ]
    ]
  )
}


resource "ibm_is_subnet" "subnet" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc_address_prefixes]
  count           = length(local.subnet)
  vpc             = local.vpc_id
  name            = local.subnet[count.index].name
  zone            = local.subnet[count.index].zone
  access_tags     = local.subnet[count.index].access_tags
  ipv4_cidr_block = local.subnet[count.index].ipv4_cidr_block
  network_acl     = local.subnet[count.index].network_acl
  public_gateway  = local.subnet[count.index].public_gateway
  tags            = local.subnet[count.index].tags
}
