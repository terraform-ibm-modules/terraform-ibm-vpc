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
  value       = ibm_is_lb_pool.lb_pools
}

output "lb_pool_members" {
  description = "All the Load balancer Pool Members"
  value       = ibm_is_lb_pool_member.lb_members
}

output "lb_listeners" {
  description = "All the Load balancer Listeners"
  value       = ibm_is_lb_listener.lb_listeners
}

output "lb_listener_policies" {
  description = "All the Load balancer Listener Policies"
  value       = ibm_is_lb_listener_policy.lb_listener_policies
}

output "lb_listener_policy_rules" {
  description = "All the Load balancer Listener Policy Rules"
  value       = ibm_is_lb_listener_policy_rule.lb_listener_policy_rules
}