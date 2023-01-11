#####################################################
# Network ACL Configuration
#####################################################

provider "ibm" {
}

data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  rules = [
    for r in var.rules : {
      name        = r.name
      action      = r.action
      source      = r.source
      destination = r.destination
      direction   = r.direction
      icmp        = lookup(r, "icmp", null)
      tcp         = lookup(r, "tcp", null)
      udp         = lookup(r, "udp", null)
    }
  ]
}

module "network_acl" {
  # source = "terraform-ibm-modules/vpc/ibm//modules/network-acl"
  source = "../../modules/network-acl"

  name              = var.name
  vpc_id            = data.ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.resource_group.id
  rules             = local.rules
  tags              = var.tags
}
