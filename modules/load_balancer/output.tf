##############################################################################
# Load Balancer Outputs
# Copyright 2020 IBM
##############################################################################

output id {
  description = "The ID of the Load balancer"
  value       = local.load_balancer_id
}

output pool_id {
  description = "ID of Load balancer Pool"
  value       = ibm_is_lb_pool.lb_pool.id
}

output pool_member_ids {
  description = "All IDs of Load balancer Pool Members"
  value       = [for member in ibm_is_lb_pool_member.lb_pool_members : member.id]
}

output listener_id {
  description = "ID of Load Balancer Listener"
  value       = ibm_is_lb_listener.lb_listener.id
}

output listener_policy_ids {
  description = "All IDs of Load balancer Listener Policies"
  value       = [for policy in ibm_is_lb_listener_policy.lb_listener_policies : policy.id]
}

output listener_policy_rule_ids {
  description = "All IDs of Load balancer Listener Policy Rules"
  value       = [for policy_rule in ibm_is_lb_listener_policy_rule.lb_listener_policy_rules : policy_rule.id]
}


##############################################################################