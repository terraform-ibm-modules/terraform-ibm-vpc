#####################################################
# Load Balancer Outputs Configuration
# Copyright 2020 IBM
#####################################################

output "lb_id" {
  description = "The ID of the Load balancer"
  value       = module.load-balancer.lb_id
}

output "lb_pools" {
  description = "All IDs of Load balancer Pools"
  value       = module.load-balancer.lb_pools
}

output "lb_pool_members" {
  description = "All IDs of Load balancer Pool Members"
  value       = module.load-balancer.lb_pool_members
}

output "lb_listeners" {
  description = "All IDs of Load balancer Listeners"
  value       = module.load-balancer.lb_listeners
}

output "lb_listener_policies" {
  description = "All IDs of Load balancer Listener Policies"
  value       = module.load-balancer.lb_listener_policies
}

output "lb_listener_policy_rules" {
  description = "All IDs of Load balancer Listener Policy Rules"
  value       = module.load-balancer.lb_listener_policy_rules
}