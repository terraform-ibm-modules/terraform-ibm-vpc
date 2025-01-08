########################################################################################################################
# Outputs
########################################################################################################################

output "vpc" {
  description = "Configuration of newly created or existing VPC instance."
  value       = module.vpc
}

output "subnets" {
  description = "List of subnets associated with the VPC"
  value       = module.vpc.subnets
}
