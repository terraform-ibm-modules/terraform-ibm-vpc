output "vpc_id" {
  description = "The ID of the vpc"
  value       = var.create_vpc ? ibm_is_vpc.vpc.0.id : data.ibm_is_vpc.vpc_ds.0.id
}

output "vpc_default_security_group" {
  description = "The ID of the vpc default security group"
  value       = var.create_vpc ? concat(ibm_is_vpc.vpc.*.default_security_group, [""])[0] : concat(data.ibm_is_vpc.vpc_ds.*.default_security_group, [""])[0]
}

output "vpc_default_network_acl" {
  description = "The ID of the vpc default network acl"
  value       = var.create_vpc ? concat(ibm_is_vpc.vpc.*.default_network_acl, [""])[0] : concat(data.ibm_is_vpc.vpc_ds.*.default_network_acl, [""])[0]
}

output "vpc_default_routing_table" {
  description = "The ID of the vpc default Routing Table"
  value       = var.create_vpc ? concat(ibm_is_vpc.vpc.*.default_routing_table, [""])[0] : concat(data.ibm_is_vpc.vpc_ds.*.default_routing_table, [""])[0]
}

output "vpc_address_prefixes" {
  description = "The Address Prefixes of the VPC"
  value       = [for prefix in ibm_is_vpc_address_prefix.vpc_address_prefixes : prefix.id]
}

output "vpc_address_prefixes_cidr" {
  description = "The Address Prefix CIDRs of the VPC"
  value       = [for prefix in ibm_is_vpc_address_prefix.vpc_address_prefixes : prefix.cidr]
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = ibm_is_subnet.subnets.*.id
}

output "public_gateway_ids" {
  description = "The IDs of the Public Gateways"
  value       = ibm_is_public_gateway.pgws.*.id
}
