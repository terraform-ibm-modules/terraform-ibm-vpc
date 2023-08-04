##############################################################################
# VPC Resource Configuration
# Copyright 2020 IBM
##############################################################################

data ibm_is_vpc vpc {
  count = var.create_vpc ? 0 : 1
  name  = var.vpc_name
}

resource ibm_is_vpc vpc {
  count                       = var.create_vpc ? 1 : 0
  name                        = var.vpc_name
  resource_group              = var.resource_group_id
  classic_access              = var.classic_access
  address_prefix_management   = var.auto_prefix_management ? "auto" : "manual"
  default_network_acl_name    = var.default_network_acl_name == null ? null : var.default_network_acl_name
  default_security_group_name = var.default_security_group_name == null ? null : var.default_security_group_name 
  default_routing_table_name  = var.default_routing_table_name == null ? null : var.default_routing_table_name
  tags                        = var.tags
}

locals {
  vpc_id                    = var.create_vpc ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.vpc.0.id
  default_acl_id            = var.create_vpc ? ibm_is_vpc.vpc[0].default_network_acl : data.ibm_is_vpc.vpc[0].default_network_acl
  default_security_group_id = var.create_vpc ? ibm_is_vpc.vpc[0].default_security_group : data.ibm_is_vpc.vpc[0].default_security_group
  default_routing_table_id  = var.create_vpc ? ibm_is_vpc.vpc[0].default_routing_table : data.ibm_is_vpc.vpc[0].default_routing_table
  acl_id                    = var.acl_id == "" ? local.default_acl_id : var.acl_id
}

##############################################################################


##############################################################################
# Local Variables for additional components
##############################################################################

locals {
  # Create a list of subnet objects from the CIDR blocks object by flattening all arrays into a single list
  subnet_list_from_object = flatten([
    # For each key in the object create an array
    for i in keys(var.address_prefixes):
    # Each item in the list contains information about a single subnet
    [
      for j in var.address_prefixes[i]:
      {
        zone      = index(keys(var.address_prefixes), i) + 1                         # Zone 1, 2, or 3
        zone_name = "${var.region}-${index(keys(var.address_prefixes), i) + 1}"  # Contains region and zone
        cidr      = j                                                           # Subnet CIDR block
        count     = index(var.address_prefixes[i], j) + 1                            # Count of the subnet within the zone
      }
    ]
  ])

  # List of zones where gatways will be created
  prefix_zones = distinct(local.subnet_list_from_object.*.zone)
}

##############################################################################


##############################################################################
# Create Address Prefixes
##############################################################################

resource ibm_is_vpc_address_prefix address_prefixes {
  count = length(local.subnet_list_from_object)
  name  = "${var.prefix}-prefix-zone-${local.subnet_list_from_object[count.index].zone}-subnet-${local.subnet_list_from_object[count.index].count}" 
  zone  = local.subnet_list_from_object[count.index].zone_name
  vpc   = local.vpc_id
  cidr  = local.subnet_list_from_object[count.index].cidr
}

##############################################################################


##############################################################################
# Create Public Gateways
##############################################################################

resource ibm_is_public_gateway public_gateway {
  count          = var.create_public_gateway ? length(local.prefix_zones) : 0
  name           = "${var.prefix}-public-gateway-${count.index + 1}"
  resource_group = var.resource_group_id
  vpc            = local.vpc_id
  zone           = "${var.region} + ${local.prefix_zones[count.index]}"
  tags           = var.tags
}

##############################################################################


##############################################################################
# Create Subnets
##############################################################################

resource ibm_is_subnet subnet {
  count                    = var.create_subnets_for_address_prefixes ? length(local.subnet_list_from_object) : 0
  name                     = "${var.prefix}-zone-${local.subnet_list_from_object[count.index].zone}-subnet-${local.subnet_list_from_object[count.index].count}"
  vpc                      = local.vpc_id
  resource_group           = var.resource_group_id
  zone                     = local.subnet_list_from_object[count.index].zone_name
  ipv4_cidr_block          = ibm_is_vpc_address_prefix.address_prefixes[count.index].cidr
  network_acl              = local.acl_id
  public_gateway           = var.create_public_gateway ? ibm_is_public_gateway.public_gateway[local.subnet_list_from_object[count.index].zone - 1].id : null
}

##############################################################################

