output "vpc_id" {
  description = "The ID of the vpc"
  value       = var.create_vpc ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.vpc_ds[0].id
}

output "vpc_default_security_group" {
  description = "The ID of the vpc default security group"
  value       = var.create_vpc ? ibm_is_vpc.vpc[0].default_security_group : data.ibm_is_vpc.vpc_ds[0].default_security_group
}

output "vpc_default_network_acl" {
  description = "The ID of the vpc default network acl"
  value       = var.create_vpc ? ibm_is_vpc.vpc[0].default_network_acl : data.ibm_is_vpc.vpc_ds[0].default_network_acl
}

output "vpc_default_routing_table" {
  description = "The ID of the vpc default Routing Table"
  value       = var.create_vpc ? ibm_is_vpc.vpc[0].default_routing_table : data.ibm_is_vpc.vpc_ds[0].default_routing_table
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
  value       = [for subnet in ibm_is_subnet.subnets : subnet.id]
}

output "subnet_detail_list" {
  description = "A list of subnets containing names, CIDR blocks, and zones."
  value = {
    for zone_name in distinct([
      for subnet in ibm_is_subnet.subnets :
      subnet.zone
    ]) :
    zone_name => {
      for subnet in ibm_is_subnet.subnets :
      subnet.name => {
        id   = subnet.id
        cidr = subnet.ipv4_cidr_block
        crn  = subnet.crn
      } if subnet.zone == zone_name
    }
  }
}

output "subnet_zone_list" {
  description = "A list containing subnet IDs and subnet zones"
  value = [
    for subnet in ibm_is_subnet.subnets : {
      name = subnet.name
      id   = subnet.id
      zone = subnet.zone
      cidr = subnet.ipv4_cidr_block
      crn  = subnet.crn
    }
  ]
}

output "public_gateway_ids" {
  description = "The IDs of the Public Gateways"
  value       = [for pgw in ibm_is_public_gateway.pgws : pgw.id]
}
