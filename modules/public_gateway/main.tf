##############################################################################
# Public Gateway Resource
# Copyright 2020 IBM
##############################################################################

locals {
  fip_objects = {
    # Create an object of objects to use as `floating_ip` param
    for zone in keys(var.floating_ip):
    zone => {
      # Get address if matches address regex
      address = can(regex("^(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2})$", var.floating_ip[zone])) ? var.floating_ip[zone] : null
      # Otherwise use ID
      id = can(regex("^(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2}).(2[0-5][0-9]|1[0-9]{1,2}|[0-9]{1,2})$", var.floating_ip[zone])) ? null : var.floating_ip[zone]
    }
  }
}

resource ibm_is_public_gateway gateway {
  count          = length(var.zones)
  name           = "${var.prefix}-public-gateway-${var.zones[count.index]}"
  resource_group = var.resource_group_id
  vpc            = var.vpc_id
  zone           = var.zones[count.index]
  floating_ip    = (
    # Check if floating IP in the zone is an empty string
    var.floating_ip["zone-${split("-", var.zones[count.index])[2]}"] == "" 
    # If if is, return null
    ? null 
    # Otherwise return the value from fip objects
    :local.fip_objects["zone-${split("-", var.zones[count.index])[2]}"]
  )
  tags           = var.tags
}

##############################################################################


##############################################################################
# Public Gateway Data Sources
##############################################################################

data ibm_is_public_gateway gateway {
  count = length(var.public_gateway_names)
  name  = var.public_gateway_names[count.index]
}

##############################################################################


##############################################################################
# Locals For Outputs
##############################################################################

locals {
  public_gateways = flatten([
    ibm_is_public_gateway.gateway,
    data.ibm_is_public_gateway.gateway
  ])
}

##############################################################################