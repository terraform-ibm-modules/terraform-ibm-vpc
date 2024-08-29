#####################################################
# Virtual Private Endpoint Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_is_vpc" "vpc" {
  count = var.create_endpoint_gateway ? 1 : 0
  name  = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  endpoint_target = [
    for target in var.target : {
      resource_type = target.resource_type
      name          = lookup(target, "name", "")
      crn           = lookup(target, "crn", "")
  }]
  endpoint_ips = [
    for ip in var.ips : {
      id     = lookup(ip, "id", "")
      name   = lookup(ip, "name", "")
      subnet = lookup(ip, "subnet", "")
    }
  ]
  endpoint_reserved_ips = [
    for ip in var.reserved_ips : {
      reserved_ip = ip.reserved_ip
    }
  ]
}

module "vpe" {
  // source = "terraform-ibm-modules/vpc/ibm//modules/vpe"
  source = "../../modules/vpe"

  create_endpoint_gateway = var.create_endpoint_gateway
  name                    = var.name
  vpc_id                  = var.create_endpoint_gateway ? data.ibm_is_vpc.vpc[0].id : null
  resource_group_id       = data.ibm_resource_group.resource_group.id
  target                  = local.endpoint_target
  ips                     = local.endpoint_ips
  tags                    = var.tags
  endpoint_gateway        = var.endpoint_gateway
  reserved_ips            = local.endpoint_reserved_ips
}
