#####################################################
# Security group Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_is_vpc" "vpc" {
  count = var.create_security_group ? 1 : 0
  name  = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  rules = [
    for r in var.security_group_rules : {
      name       = r.name
      direction  = r.direction
      remote     = lookup(r, "remote", null)
      ip_version = lookup(r, "ip_version", null)
      icmp       = lookup(r, "icmp", null)
      tcp        = lookup(r, "tcp", null)
      udp        = lookup(r, "udp", null)
    }
  ]
}

module "security_group" {
  // source = "terraform-ibm-modules/vpc/ibm//modules/security-group"
  source = "../../modules/security-group"

  create_security_group = var.create_security_group
  name                  = var.name
  vpc_id                = var.create_security_group ? data.ibm_is_vpc.vpc[0].id : null
  resource_group_id     = data.ibm_resource_group.resource_group.id
  security_group        = var.security_group
  security_group_rules  = local.rules
}