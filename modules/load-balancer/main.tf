#####################################################
# Load Balancer Resources
# Copyright 2020 IBM
#####################################################

##############################################################################
# Load Balancer
##############################################################################

locals {

  lb_pool_members_list = flatten([
    for pool in var.lb_pools : [
      for member in pool["lb_pool_members"] : [
        merge(member, { lb_pool_name : pool["name"] })
      ]
    ]
  ])

  lb_listener_policies_list = flatten([
    for listener in var.lb_listeners : [
      for policy in listener["lb_listener_policies"] : [
        merge(policy, { listener_port : listener["port"] })
      ]
    ]
  ])


  lb_listener_policy_rules_list = flatten([
    for listener in var.lb_listeners : [
      for policy in listener["lb_listener_policies"] : [
        for rule in policy["lb_listener_policy_rules"] : [
          merge(rule, { listener_port : listener["port"], listener_policy_name : policy["name"] })
        ]
      ]
    ]
  ])

}

data "ibm_is_lb" "lb_ds" {
  count = var.create_load_balancer ? 0 : 1
  name  = var.load_balancer
}

resource "ibm_is_lb" "lbs" {
  count           = var.create_load_balancer ? 1 : 0
  name            = var.name
  subnets         = var.subnets
  type            = var.type != null ? var.type : "public" #checkov:skip=CKV2_IBM_1
  security_groups = var.security_groups
  profile         = (var.profile != null && var.logging == null ? var.profile : null)
  logging         = (var.logging != null && var.profile == null ? var.logging : false)
  resource_group  = var.resource_group_id
  tags            = var.tags
}

##############################################################################
# Load Balancer Pool
##############################################################################

resource "ibm_is_lb_pool" "lb_pools" {
  for_each                        = { for r in var.lb_pools : r.name => r }
  name                            = each.value["name"]
  lb                              = var.create_load_balancer ? ibm_is_lb.lbs[0].id : data.ibm_is_lb.lb_ds.0.id
  algorithm                       = each.value["algorithm"]
  protocol                        = each.value["protocol"]
  health_delay                    = each.value["health_delay"]
  health_retries                  = each.value["health_retries"]
  health_timeout                  = each.value["health_timeout"]
  health_type                     = each.value["health_type"]
  health_monitor_url              = lookup(each.value, "health_monitor_url", null)
  health_monitor_port             = lookup(each.value, "health_monitor_port", null)
  session_persistence_type        = lookup(each.value, "session_persistence_type", null)
  # session_persistence_cookie_name = lookup(each.value, "session_persistence_cookie_name", null)
}

##############################################################################
# Load Balancer Pool Member
##############################################################################

resource "ibm_is_lb_pool_member" "lb_members" {
  for_each       = { for r in local.lb_pool_members_list : r.port => r }
  lb             = var.create_load_balancer ? ibm_is_lb.lbs[0].id : data.ibm_is_lb.lb_ds.0.id
  pool           = ibm_is_lb_pool.lb_pools[each.value["lb_pool_name"]].id
  port           = each.value["port"]
  target_address = lookup(each.value, "target_address", null)
  target_id      = lookup(each.value, "target_id", null)
  weight         = lookup(each.value, "weight", null)
}

##############################################################################
# Load Balancer Listener
##############################################################################

resource "ibm_is_lb_listener" "lb_listeners" {
  for_each              = { for r in var.lb_listeners : r.port => r }
  lb                    = var.create_load_balancer ? ibm_is_lb.lbs[0].id : data.ibm_is_lb.lb_ds.0.id
  port                  = each.value["port"]
  protocol              = each.value["protocol"]
  default_pool          = lookup(each.value, "default_pool", null) != null ? ibm_is_lb_pool.lb_pools[each.value["default_pool"]].id : null
  certificate_instance  = lookup(each.value, "certificate_instance", null)
  connection_limit      = lookup(each.value, "connection_limit", null)
  accept_proxy_protocol = lookup(each.value, "accept_proxy_protocol", null)
}

##############################################################################
# Load Balancer Listener Policy
##############################################################################

resource "ibm_is_lb_listener_policy" "lb_listener_policies" {
  for_each                = { for r in local.lb_listener_policies_list : r.name => r }
  name                    = each.value["name"]
  lb                      = var.create_load_balancer ? ibm_is_lb.lbs[0].id : data.ibm_is_lb.lb_ds.0.id
  listener                = ibm_is_lb_listener.lb_listeners[each.value["listener_port"]].id
  action                  = each.value["action"]
  priority                = each.value["priority"]
  target_id               = lookup(each.value, "target_lb_pool", null) != null ? ibm_is_lb_pool.lb_pools[each.value["target_lb_pool"]].id : null
  target_http_status_code = lookup(each.value, "target_http_status_code", null)
  target_url              = lookup(each.value, "target_url", null)
  dynamic "rules" {
    for_each = lookup(each.value, "rules") == null ? [] : [each.value.rules]
    content {
      condition = rules.value["condition"]
      type      = rules.value["type"]
      field     = lookup(rules.value, "field", null)
      value     = rules.value["value"]
    }
  }
}

##############################################################################
# Load Balancer Listener Policy Rule
##############################################################################

resource "ibm_is_lb_listener_policy_rule" "lb_listener_policy_rules" {
  for_each  = { for r in local.lb_listener_policy_rules_list : r.name => r }
  lb        = var.create_load_balancer ? ibm_is_lb.lbs[0].id : data.ibm_is_lb.lb_ds.0.id
  listener  = ibm_is_lb_listener.lb_listeners[each.value["listener_port"]].id
  policy    = ibm_is_lb_listener_policy.lb_listener_policies[each.value["listener_policy_name"]].id
  condition = each.value["condition"]
  type      = each.value["type"]
  value     = each.value["value"]
  field     = lookup(each.value, "field", null)
}