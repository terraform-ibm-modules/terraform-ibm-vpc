##############################################################################
# Floating IP
# Copyright 2020 IBM
##############################################################################

output id {
  description = "The ID of the Floating IP"
  value       = ibm_is_floating_ip.fip.id
}

output address {
  description = "The Floating IP address"
  value       = ibm_is_floating_ip.fip.address
}

output detail {
  description = "Floating IP address detail"
  value       = {
    id      = ibm_is_floating_ip.fip.id
    address = ibm_is_floating_ip.fip.address
    zone    = ibm_is_floating_ip.fip.zone
  }
}

##############################################################################