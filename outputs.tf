########################################################################################################################
# Outputs
########################################################################################################################

output "vpc" {
  description = "Configuration of newly created or existing VPC instance."
  value       = module.vpc
}

output "subnet" {
  description = "List of subnets associated with this VPC"
  value       = module.vpc.subnets
}

