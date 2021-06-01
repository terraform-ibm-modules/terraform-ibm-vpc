#####################################################
# Load Balanncer Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  lb_pools = [
    for r in var.lb_pools : {
      name                            = r.name
      algorithm                       = r.algorithm
      protocol                        = r.protocol
      health_delay                    = r.health_delay
      health_retries                  = r.health_retries
      health_timeout                  = r.health_timeout
      health_type                     = r.health_type
      health_monitor_url              = lookup(r, "health_monitor_url", null)
      health_monitor_port             = lookup(r, "health_monitor_port", null)
      session_persistence_type        = lookup(r, "session_persistence_type", null)
      session_persistence_cookie_name = lookup(r, "session_persistence_cookie_name", null)
    }
  ]
  lb_pool_members = [
    for r in var.lb_pool_members : {
      lb_pool_name   = r.lb_pool_name
      port           = r.port
      target_address = lookup(r, "target_address", null)
      target_id      = lookup(r, "target_id", null)
      weight         = lookup(r, "weight", null)
    }
  ]

  lb_listeners = [
    for r in var.lb_listeners : {
      lb_pool_name          = r.lb_pool_name
      port                  = r.port
      protocol              = r.protocol
      default_pool          = lookup(r, "default_pool", null)
      certificate_instance  = lookup(r, "certificate_instance", null)
      connection_limit      = lookup(r, "connection_limit", null)
      accept_proxy_protocol = lookup(r, "accept_proxy_protocol", null)
    }
  ]

  lb_listener_policies = [
    for r in var.lb_listener_policies : {
      name                    = r.name
      listener_name           = r.listener_name
      action                  = r.action
      priority                = r.priority
      target_id               = lookup(r, "target_lb_pool", null)
      target_http_status_code = lookup(r, "target_http_status_code", null)
      target_url              = lookup(r, "target_url", null)
      rules                   = lookup(r, "rules", [])
    }
  ]

  lb_listener_policy_rules = [
    for r in var.lb_listener_policy_rules : {
      name                 = r.name
      listener_name        = r.listener_name
      listener_policy_name = r.listener_policy_name
      condition            = r.condition
      type                 = r.type
      value                = r.value
      field                = lookup(r, "field", null)

    }
  ]
}

module "load-balancer" {
  source = "../../modules/load-balancer"

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
  lb_pools                 = local.lb_pools
  lb_pool_members          = local.lb_pool_members
  lb_listeners             = local.lb_listeners
  lb_listener_policies     = local.lb_listener_policies
  lb_listener_policy_rules = local.lb_listener_policy_rules
}
