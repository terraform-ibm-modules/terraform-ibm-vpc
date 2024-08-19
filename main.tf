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
  address_prefix = {
    for location in var.locations : location.address_prefix.name => {
      zone = location.zone
      cidr = location.address_prefix.cidr
    } if location.address_prefix != null
  }
}

resource "ibm_is_vpc_address_prefix" "vpc_address_prefixes" {
  for_each = local.address_prefix
  name     = each.key
  vpc      = local.vpc_id
  zone     = each.value.zone
  cidr     = each.value.cidr
}

# #####################################################
# # Create Public Gateways
# #####################################################

locals {
  public_gateways = {
    for location in var.locations : location.public_gateway.name => {
      zone        = location.zone
      name        = location.public_gateway.name
      floating_ip = location.public_gateway.floating_ip
      tags        = location.public_gateway.tags
    } if location.public_gateway != null
  }
}

resource "ibm_is_public_gateway" "public_gateway" {
  for_each       = local.public_gateways
  name           = each.key
  resource_group = var.resource_group_id
  vpc            = local.vpc_id
  zone           = each.value.zone
  floating_ip    = each.value.floating_ip
  tags           = each.value.tags
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
          public_gateway  = subnet.attach_public_gateway ? ibm_is_public_gateway.public_gateway[location.public_gateway.name].id : null
          tags            = subnet.tags
        }
      ]
    ]
  )
}


resource "ibm_is_subnet" "subnet" {
  depends_on      = [ibm_is_vpc_address_prefix.vpc_address_prefixes]
  for_each        = { for subnet in local.subnet : subnet.name => subnet }
  vpc             = local.vpc_id
  name            = each.key
  zone            = each.value.zone
  access_tags     = each.value.access_tags
  ipv4_cidr_block = each.value.ipv4_cidr_block
  network_acl     = each.value.network_acl
  public_gateway  = each.value.public_gateway
  tags            = each.value.tags
}

resource "ibm_is_network_acl" "network_acl" {
  for_each       = { for nacls in var.network_acls : nacls.name => nacls }
  name           = each.key
  vpc            = local.vpc_id
  resource_group = var.resource_group_id

  # Create ACL rules
  dynamic "rules" {
    for_each = each.value.rules
    content {
      name        = rules.value.name
      action      = rules.value.action
      source      = rules.value.source
      destination = rules.value.destination
      direction   = rules.value.direction

      dynamic "tcp" {
        for_each = (
          # if rules null
          rules.value.tcp == null
          # empty array
          ? []
          # otherwise check each possible field against how many of the values are
          # equal to null and only include rules where one of the values is not null
          # this allows for patterns to include `tcp` blocks for conversion to list
          # while still not creating a rule. default behavior would force the rule to
          # be included if all indiviual values are set to null
          : length([
            for value in ["port_min", "port_max", "source_port_min", "source_port_min"] :
            true if lookup(rules.value["tcp"], value, null) == null
          ]) == 4
          ? []
          : [rules.value]
        )
        content {
          port_min        = lookup(rules.value.tcp, "port_min", null)
          port_max        = lookup(rules.value.tcp, "port_max", null)
          source_port_min = lookup(rules.value.tcp, "source_port_min", null)
          source_port_max = lookup(rules.value.tcp, "source_port_max", null)
        }
      }

      dynamic "udp" {
        for_each = (
          # if rules null
          rules.value.udp == null
          # empty array
          ? []
          # otherwise check each possible field against how many of the values are
          # equal to null and only include rules where one of the values is not null
          # this allows for patterns to include `udp` blocks for conversion to list
          # while still not creating a rule. default behavior would force the rule to
          # be included if all indiviual values are set to null
          : length([
            for value in ["port_min", "port_max", "source_port_min", "source_port_min"] :
            true if lookup(rules.value["udp"], value, null) == null
          ]) == 4
          ? []
          : [rules.value]
        )
        content {
          port_min        = lookup(rules.value.udp, "port_min", null)
          port_max        = lookup(rules.value.udp, "port_max", null)
          source_port_min = lookup(rules.value.udp, "source_port_min", null)
          source_port_max = lookup(rules.value.udp, "source_port_max", null)
        }
      }

      dynamic "icmp" {
        for_each = (
          # if rules null
          rules.value.icmp == null
          # empty array
          ? []
          # otherwise check each possible field against how many of the values are
          # equal to null and only include rules where one of the values is not null
          # this allows for patterns to include `udp` blocks for conversion to list
          # while still not creating a rule. default behavior would force the rule to
          # be included if all indiviual values are set to null
          : length([
            for value in ["code", "type"] :
            true if lookup(rules.value["icmp"], value, null) == null
          ]) == 2
          ? []
          : [rules.value]
        )
        content {
          type = rules.value.icmp.type
          code = rules.value.icmp.code
        }
      }
    }
  }
}
