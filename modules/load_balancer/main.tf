##############################################################################
# Create Load Balancer or Get Load Balancer from Data
##############################################################################

resource ibm_is_lb lb {
  count           = var.create_load_balancer ? 1 : 0
  name            = var.name
  subnets         = var.subnet_ids
  type            = var.use_public_load_balancer ? "public" : "private"
  security_groups = var.security_group_ids
  profile         = var.logging == null && var.security_group_ids == null ? "network-fixed" : null
  logging         = var.logging != null ? var.logging : null
  resource_group  = var.resource_group_id
  tags            = var.tags
}

data ibm_is_lb lb {
  count = var.create_load_balancer ? 0 : 1
  name  = var.name
}

locals {
  load_balancer_id = var.create_load_balancer ? ibm_is_lb.lb[0].id : data.ibm_is_lb.lb.0.id
}

##############################################################################


##############################################################################
# Load Balancer Pool
##############################################################################

resource ibm_is_lb_pool lb_pool {
  lb                       = local.load_balancer_id
  name                     = var.pool_name
  algorithm                = var.pool_algorithm                      
  protocol                 = var.pool_protocol   
  proxy_protocol           = var.pool_proxy_protocol        
  health_delay             = var.pool_health_delay       
  health_retries           = var.pool_health_retries     
  health_timeout           = var.pool_health_timeout     
  health_type              = var.pool_health_type        
  health_monitor_url       = var.pool_health_monitor_url 
  health_monitor_port      = var.pool_health_monitor_port
  session_persistence_type = var.pool_session_persistence_type
}

##############################################################################


##############################################################################
# Load Balancer Pool Member
##############################################################################

resource ibm_is_lb_pool_member lb_pool_members {
  for_each       = toset(var.pool_members)
  lb             = local.load_balancer_id
  pool           = element(split("/", ibm_is_lb_pool.lb_pool.id), 1)
  port           = var.pool_member_port

  # Check to see if pool member is ip address. If it is, use that value, otherwise null.
  target_address = try(
    regex(
      "^(25[0-6]|2[0-4][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\.(25[0-6]|2[0-4][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\.(25[0-6]|2[0-4][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\.(25[0-6]|2[0-4][0-9]|1[0-9]{1,2}|[0-9]{1,2})$", 
      each.value
    ), null
  )

  # If the target id does not match the ip address regex, return the value, otherwise null
  target_id      = length(
    regexall(
      "^(25[0-6]|2[0-4][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\.(25[0-6]|2[0-4][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\.(25[0-6]|2[0-4][0-9]|1[0-9]{1,2}|[0-9]{1,2})\\.(25[0-6]|2[0-4][0-9]|1[0-9]{1,2}|[0-9]{1,2})$", 
      each.value
    )
  ) == 0 ? each.value : null

  # If protocol is not weighted round robin, null. Otherwise, get weight from weights list
  weight         = var.pool_algorithm != "weighted_round_robin" ? null : var.pool_member_weights[index(var.pool_members, each.value)]
}

##############################################################################


##############################################################################
# Load Balancer Listener
##############################################################################

resource ibm_is_lb_listener lb_listener {
  lb                    = local.load_balancer_id
  port                  = var.listener_port
  protocol              = var.listener_protocol
  default_pool          = element(split("/", ibm_is_lb_pool.lb_pool.id), 1)
  certificate_instance  = var.listener_certificate_instance 
  connection_limit      = var.listener_connection_limit     
  accept_proxy_protocol = var.listener_accept_proxy_protocol

  depends_on            = [ ibm_is_lb_pool_member.lb_pool_members ]
}

##############################################################################


##############################################################################
# Load Balancer Listener Policies and Rules
##############################################################################

locals {
  lb_listener_policy_rules_list = flatten([
    for policy in var.listener_policies : [
      for rule in policy.rules : [
        merge(rule, { listener_policy_name : policy["name"] })
      ]
    ]
  ])
}

resource ibm_is_lb_listener_policy lb_listener_policies {
  for_each                = { for policy in var.listener_policies: policy.name => policy }
  name                    = each.value["name"]
  lb                      = local.load_balancer_id
  listener                = ibm_is_lb_listener.lb_listener.id
  action                  = each.value["action"]
  priority                = each.value["priority"]
  target_id               = lookup(each.value, "target_pool_forward_id", null)
  target_http_status_code = lookup(each.value, "target_http_status_code", null)
  target_url              = lookup(each.value, "target_url", null)
}

resource ibm_is_lb_listener_policy_rule lb_listener_policy_rules {
  for_each  = { for rule in local.lb_listener_policy_rules_list : rule.name => rule }
  lb        = local.load_balancer_id
  listener  = ibm_is_lb_listener.lb_listener.id
  policy    = ibm_is_lb_listener_policy.lb_listener_policies[each.value["listener_policy_name"]].id
  condition = each.value["condition"]
  type      = each.value["type"]
  value     = each.value["value"]
  field     = lookup(each.value, "field", null)
}

##############################################################################