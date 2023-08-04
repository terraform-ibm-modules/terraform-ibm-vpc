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
      name                                = r.name
      algorithm                           = r.algorithm
      protocol                            = r.protocol
      health_delay                        = r.health_delay
      health_retries                      = r.health_retries
      health_timeout                      = r.health_timeout
      health_type                         = r.health_type
      health_monitor_url                  = lookup(r, "health_monitor_url", null)
      health_monitor_port                 = lookup(r, "health_monitor_port", null)
      session_persistence_type            = lookup(r, "session_persistence_type", null)
      session_persistence_app_cookie_name = lookup(r, "session_persistence_app_cookie_name", null)
      proxy_protocol                      = lookup(r, "proxy_protocol", null)
      lb_pool_members                     = lookup(r, "lb_pool_members", null)
    }
  ]

  lb_pool_members = [
    for p in var.lb_pools : [
      for m in p["lb_pool_members"] : {
        port           = m.port
        target_address = lookup(m, "target_address", null)
        target_id      = lookup(m, "target_id", null)
        weight         = lookup(m, "weight", null)
      }
    ]
  ]

  lb_listeners = [
    for l in var.lb_listeners : {
      port                  = l.port
      protocol              = l.protocol
      default_pool          = lookup(l, "default_pool", null)
      certificate_instance  = lookup(l, "certificate_instance", null)
      connection_limit      = lookup(l, "connection_limit", null)
      accept_proxy_protocol = lookup(l, "accept_proxy_protocol", null)
      lb_listener_policies  = lookup(l, "lb_listener_policies", null)
    }
  ]

  lb_listener_policies = [
    for l in var.lb_listeners : [
      for p in l["lb_listener_policies"] : {
        name                     = p.name
        action                   = p.action
        priority                 = p.priority
        target_id                = lookup(p, "target_lb_pool", null)
        target_http_status_code  = lookup(p, "target_http_status_code", null)
        target_url               = lookup(p, "target_url", null)
        rules                    = lookup(p, "rules", null)
        lb_listener_policy_rules = lookup(p, "lb_listener_policy_rules", null)
      }
    ]
  ]

  lb_listener_policy_rules = [
    for l in var.lb_listeners : [
      for p in l["lb_listener_policies"] : [
        for r in p["lb_listener_policy_rules"] : {
          name      = r.name
          condition = r.condition
          type      = r.type
          value     = r.value
          field     = lookup(r, "field", null)
        }
      ]
    ]
  ]
}

module "load-balancer" {
  // source = "terraform-ibm-modules/vpc/ibm//modules/load-balancer"
  source = "../../modules/load-balancer"

  create_load_balancer = var.create_load_balancer
  name                 = var.name
  resource_group_id    = data.ibm_resource_group.resource_group.id
  subnets              = var.subnets
  security_groups      = var.security_groups
  type                 = var.type
  profile              = var.profile
  logging              = var.logging
  tags                 = var.tags
  load_balancer        = var.load_balancer
  lb_pools             = local.lb_pools
  lb_listeners         = local.lb_listeners
}
