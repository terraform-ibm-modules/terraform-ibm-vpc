##############################################################################
# Subnet Resource
# Copyright 2020 IBM
##############################################################################

locals {
  subnet_list         = flatten([
    # For each key in the object create an array
    for zone in keys(var.subnets):
    # Each item in the list contains information about a single subnet
    [
      for value in var.subnets[zone]:
      {
        zone       = index(keys(var.subnets), zone) + 1                         # Zone 1, 2, or 3
        zone_name  = "${var.region}-${index(keys(var.subnets), zone) + 1}"  # Contains region and zone
        # Check for regex of cidr block or if total ipv4 address count
        cidr        = can(regex("^(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\/(3[0-2]|2[0-9]|1[0-9]|[0-9])$", value)) ? value : null
        # Prefix name if prefixes are being created
        prefix_name = can(regex("^(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\/(3[0-2]|2[0-9]|1[0-9]|[0-9])$", value)) ? "${var.prefix}-${var.region}-${index(keys(var.subnets), zone) + 1}-prefix-${index(var.subnets[zone], value) + 1}" : null
        # IPV4 count if not a cidr block
        ipv4_count  = !can(regex("^(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\/(3[0-2]|2[0-9]|1[0-9]|[0-9])$", value)) ? value : null
        # Count of the subnet within the zone
        count       = index(var.subnets[zone], value) + 1                            
      }
    ]
  ])

  # List of public gateways
  public_gateway_list = [
    for gateway in keys(var.public_gateways):
    var.public_gateways[gateway] == "" ? null : var.public_gateways[gateway]
  ]

  # List of CIDRs
  cidr_list = !var.create_subnet_prefixes ? {} : {
    for subnet in local.subnet_list:
     subnet.prefix_name => {
      cidr = subnet.cidr
      zone = subnet.zone_name
    } if lookup(subnet, "cidr", null) != null
  }
}

##############################################################################


##############################################################################
# Create New Prefixes
##############################################################################

resource ibm_is_vpc_address_prefix subnet_prefix {
  for_each = local.cidr_list
  name     = each.key
  zone     = each.value.zone
  vpc      = var.vpc_id
  cidr     = each.value.cidr
}

##############################################################################


##############################################################################
# Create Subnets
##############################################################################

resource ibm_is_subnet subnets {
  count                    = length(local.subnet_list)
  vpc                      = var.vpc_id
  name                     = "${var.prefix}-zone-${local.subnet_list[count.index].zone}-subnet-${local.subnet_list[count.index].count}"
  zone                     = local.subnet_list[count.index].zone_name
  resource_group           = var.resource_group_id
  total_ipv4_address_count = local.subnet_list[count.index].ipv4_count
  ipv4_cidr_block          = (
    # Check to see if subnet prefixes are being created and if the subnet has a cidr value
    var.create_subnet_prefixes && lookup(local.subnet_list[count.index], "cidr", null) != null
    # If create subnet prefixes is enabled and the `cidr` value for the subnet is not null, get the prefix by name
    ? ibm_is_vpc_address_prefix.subnet_prefix[local.subnet_list[count.index].prefix_name].cidr
    # Otherwise lookup and return null if no `cidr` value
    : local.subnet_list[count.index].cidr
  )
  network_acl              = var.acl_id
  routing_table            = var.routing_table_id
  public_gateway           = local.public_gateway_list[local.subnet_list[count.index].zone - 1] == "" ? null : local.public_gateway_list[local.subnet_list[count.index].zone - 1]
  depends_on               = [ ibm_is_vpc_address_prefix.subnet_prefix ]
}

##############################################################################


##############################################################################
# Get Subnets From Data
##############################################################################

data ibm_is_subnet subnets {
  count = length(var.subnet_names)
  name  = var.subnet_names[count.index]
}

##############################################################################


##############################################################################
# Locals For Outputs
##############################################################################

locals {
  all_subnets = flatten([
    ibm_is_subnet.subnets,
    data.ibm_is_subnet.subnets
  ])
}

##############################################################################