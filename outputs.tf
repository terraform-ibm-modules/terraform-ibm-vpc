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

output "public_gateways" {
  value = ibm_is_public_gateway.public_gateway
}
