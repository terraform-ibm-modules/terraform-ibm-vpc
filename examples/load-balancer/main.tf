#####################################################
# Load Balanncer Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "load-balancer" {
  source = "terraform-ibm-modules/vpc/ibm//modules/load-balancer"

  create_load_balancer     = var.create_load_balancer
  name                     = var.name
  resource_group_id        = data.ibm_resource_group.resource_group.id
  subnets                  = var.subnets
  security_groups          = var.security_groups
  type                     = var.type
  profile                  = var.profile
  logging                  = var.logging
  tags                     = var.tags
  load_balancer            = var.load_balancer
  lb_pools                 = var.lb_pools
  lb_pool_members          = var.lb_pool_members
  lb_listeners             = var.lb_listeners
  lb_listener_policies     = var.lb_listener_policies
  lb_listener_policy_rules = var.lb_listener_policy_rules
}