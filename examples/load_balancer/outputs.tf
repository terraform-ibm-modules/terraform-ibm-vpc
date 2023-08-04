##############################################################################
# Load Balancer Outputs Configuration
# Copyright 2020 IBM
##############################################################################

output id {
  description = "The ID of the Load balancer"
  value       = module.load_balancer.id
}

output pool_id {
  description = "ID of Load balancer Pool"
  value       = module.load_balancer.pool_id
}

output pool_member_ids {
  description = "All IDs of Load balancer Pool Members"
  value       = module.load_balancer.pool_member_ids
}

output listener_id {
  description = "ID of Load balancer Listeners"
  value       = module.load_balancer.listener_id
}

output listener_policy_ids {
  description = "All IDs of Load balancer Listener Policies"
  value       = module.load_balancer.listener_policy_ids
}

output listener_policy_rule_ids {
  description = "All IDs of Load balancer Listener Policy Rules"
  value       = module.load_balancer.listener_policy_rule_ids
}

##############################################################################