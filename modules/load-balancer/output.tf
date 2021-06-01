#####################################################
# Load Balancer Resources
# Copyright 2020 IBM
#####################################################

output "lb_id" {
  description = "The ID of the Load balancer"
  value       = ibm_is_lb.lbs.*.id
}

output "lb_pools" {
  description = "All the Load balancer Pools"
  value       = [for pool in ibm_is_lb_pool.lb_pools : pool.id]
}

output "lb_pool_members" {
  description = "All the Load balancer Pool Members"
  value       = [for member in ibm_is_lb_pool_member.lb_members : member.id]
}

output "lb_listeners" {
  description = "All the Load balancer Listeners"
  value       = [for listener in ibm_is_lb_listener.lb_listeners : listener.id]
}

output "lb_listener_policies" {
  description = "All the Load balancer Listener Policies"
  value       = [for policy in ibm_is_lb_listener_policy.lb_listener_policies : policy.id]
}

output "lb_listener_policy_rules" {
  description = "All the Load balancer Listener Policy Rules"
  value       = [for policy_rule in ibm_is_lb_listener_policy_rule.lb_listener_policy_rules : policy_rule.id]
}