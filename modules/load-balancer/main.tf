#####################################################
# Load Balancer Resources
# Copyright 2020 IBM
#####################################################

##############################################################################
# Load Balancer
##############################################################################

resource "ibm_is_lb" "lbs" {
  count           = var.create_load_balancer ? 1 : 0
  name            = var.name
  subnets         = var.subnets
  type            = var.type != null ? var.type : "public"
  security_groups = (var.security_groups != null ? var.security_groups : [])
  profile         = (var.profile != null ? var.profile : null)
  logging         = (var.logging != null ? var.logging : false)
  resource_group  = var.resource_group_id
  tags            = (var.tags != null ? var.tags : [])
}

##############################################################################
# Load Balancer Pool
##############################################################################

resource "ibm_is_lb_pool" "lb_pools" {
  for_each                        = { for r in var.lb_pools : r.name => r }
  name                            = each.value["name"]
  lb                              = var.create_load_balancer ? ibm_is_lb.lbs[0].id : var.load_balancer
  algorithm                       = each.value["algorithm"]
  protocol                        = each.value["protocol"]
  health_delay                    = each.value["health_delay"]
  health_retries                  = each.value["health_retries"]
  health_timeout                  = each.value["health_timeout"]
  health_type                     = each.value["health_type"]
  health_monitor_url              = lookup(each.value, "health_monitor_url", null)
  health_monitor_port             = lookup(each.value, "health_monitor_port", null)
  session_persistence_type        = lookup(each.value, "session_persistence_type", null)
  session_persistence_cookie_name = lookup(each.value, "session_persistence_cookie_name", null)
}

##############################################################################
# Load Balancer Pool Member
##############################################################################

resource "ibm_is_lb_pool_member" "lb_members" {
  for_each       = { for r in var.lb_pool_members : r.address => r }
  lb             = var.create_load_balancer ? ibm_is_lb.lbs[0].id : var.load_balancer
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
  lb                    = var.create_load_balancer ? ibm_is_lb.lbs[0].id : var.load_balancer
  port                  = each.value["port"]
  protocol              = each.value["protocol"]
  default_pool          = lookup(each.value, "default_pool", null) != null ? ibm_is_lb_pool.lb_pools[each.value["default_pool"]].id : null
  certificate_instance  = lookup(each.value, "certificate_instance", null)
  connection_limit      = lookup(each.value, "connection_limit", null)
  accept_proxy_protocol = lookup(each.value, "accept_proxy_protocol", null)
  depends_on            = [ibm_is_lb_pool_member.lb_members]
}

##############################################################################
# Load Balancer Listener Policy
##############################################################################

resource "ibm_is_lb_listener_policy" "lb_listener_policies" {
  for_each                = { for r in var.lb_listener_policies : r.name => r }
  name                    = each.value["name"]
  lb                      = var.create_load_balancer ? ibm_is_lb.lbs[0].id : var.load_balancer
  listener                = ibm_is_lb_listener.lb_listeners[each.value["listener_name"]].id
  action                  = each.value["action"]
  priority                = each.value["priority"]
  target_id               = lookup(each.value, "target_lb_pool", null) != null ? ibm_is_lb_pool.lb_pools[each.value["target_lb_pool"]].id : null
  target_http_status_code = lookup(each.value, "target_http_status_code", null)
  target_url              = lookup(each.value, "target_url", null)
  dynamic "rules" {
    for_each = lookup(each.value, "rules", [])
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
  for_each  = { for r in var.lb_listener_policy_rules : r.name => r }
  name      = each.value["name"]
  lb        = var.create_load_balancer ? ibm_is_lb.lbs[0].id : var.load_balancer
  listener  = ibm_is_lb_listener.lb_listener[each.value["listener_name"]].id
  policy    = ibm_is_lb_listener_policy.lb_listener_policies[each.value["listener_policy_name"]].id
  condition = each.value["condition"]
  type      = each.value["type"]
  value     = each.value["value"]
  field     = lookup(each.value, "field", null)
}