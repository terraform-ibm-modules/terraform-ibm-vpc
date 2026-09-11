##############################################################################
# Outputs
##############################################################################

output "region" {
  description = "The region all resources were provisioned in"
  value       = var.region
}

output "prefix" {
  description = "The prefix used to name all provisioned resources"
  value       = var.prefix
}

output "resource_group_name" {
  description = "The name of the resource group used"
  value       = module.resource_group.resource_group_name
}

output "vpc" {
  description = "VPC module values"
  value       = module.vpc
}

output "lb_id" {
  description = "The ID of the load balancer"
  value       = module.load_balancer.lb_id
}

output "lb_pools" {
  description = "All IDs of load balancer pools"
  value       = module.load_balancer.lb_pools
}

output "lb_listeners" {
  description = "All IDs of load balancer listeners"
  value       = module.load_balancer.lb_listeners
}
