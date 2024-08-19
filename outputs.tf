########################################################################################################################
# Outputs
########################################################################################################################

output "vpc" {
  value = var.create_vpc ? ibm_is_vpc.vpc : data.ibm_is_vpc.vpc
}

output "address_prefix" {
  value = ibm_is_vpc_address_prefix.vpc_address_prefixes
}

output "subnets" {
  value = ibm_is_subnet.subnet
}

output "network_acl" {
  value = ibm_is_network_acl.network_acl
}
