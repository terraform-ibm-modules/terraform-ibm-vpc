##############################################################################
# Public Gateway Resource Output
# Copyright 2020 IBM
##############################################################################

output ids {
  description = "The ID of the Public Gateways"
  value       = local.public_gateways.*.id
}

output ids_by_zone {
  description = "A list of IDs by zone"
  value       = {
    for gateway in local.public_gateways:
    ("zone-${split("-", gateway.zone)[2]}") => gateway.id
  }
}

output addresses {
  description = "List of public gatway addresses"
  value       = [
    for gateway in local.public_gateways:
    lookup(gateway.floating_ip, "address", null) if (contains(keys(gateway), "floating_ip"))
  ]
}

output addresses_by_zone {
  description = "A list of addresses by zone"
  value       = {
    for gateway in local.public_gateways:
    ("zone-${split("-", gateway.zone)[2]}") => lookup(gateway.floating_ip, "address", null)
  }
}

##############################################################################