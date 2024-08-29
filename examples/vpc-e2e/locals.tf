#####################################################
# VPCEnd to End Template Configuration
# Copyright 2020 IBM
#####################################################

locals {
  endpoint_target = [{
    resource_type = "provider_infrastructure_service"
    name          = "ibm-dns-server2"
    crn           = null
    }
  ]
  primary_network_interface = [{
    subnet               = module.subnet.subnet_id
    interface_name       = null
    security_groups      = null
    primary_ipv4_address = null
    }
  ]
}
