#####################################################
# Load Balancer Resources
# Copyright 2020 IBM
#####################################################

output "lb_id" {
  description = "The ID of the Load balancer"
  value       = var.create_load_balancer ? ibm_is_lb.lbs[0].id : data.ibm_is_lb.lb_ds[0].id
}

output "lb_pools" {
  description = "All IDs of Load balancer Pools"
  value       = [for pool in ibm_is_lb_pool.lb_pools : pool.id]
}

output "lb_pool_members" {
  description = "All IDs of Load balancer Pool Members"
  value       = [for member in ibm_is_lb_pool_member.lb_members : member.id]
}

output "lb_listeners" {
  description = "All IDs of Load balancer Listeners"
  value       = [for listener in ibm_is_lb_listener.lb_listeners : listener.id]
}

output "lb_listener_policies" {
  description = "All IDs of Load balancer Listener Policies"
  value       = [for policy in ibm_is_lb_listener_policy.lb_listener_policies : policy.id]
}

output "lb_listener_policy_rules" {
  description = "All IDs of Load balancer Listener Policy Rules"
  value       = [for policy_rule in ibm_is_lb_listener_policy_rule.lb_listener_policy_rules : policy_rule.id]
}
