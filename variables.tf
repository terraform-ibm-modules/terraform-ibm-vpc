########################################################################################################################
# Input Variables
########################################################################################################################

variable "create_vpc" {
  description = "True to create new VPC. False if VPC is already existing and subnets or address prefixies are to be added"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "Name of the vpc"
  type        = string
  default     = null
}

variable "resource_group_id" {
  description = "ID of resource group."
  type        = string
  default     = null
}

variable "auto_assign_address_prefix" {
  description = "Set to true to create a default address prefix automatically for each zone in the VPC."
  type        = bool
  default     = true
}

variable "default_network_acl_name" {
  description = "Name of the Default ACL"
  type        = string
  default     = "default-network-acl"
}

variable "default_security_group_name" {
  description = "Name of the Default Security Group"
  type        = string
  default     = "default_security_group"
}

variable "default_routing_table_name" {
  description = "Name of the Default Routing Table"
  type        = string
  default     = "default_routing_table"
}

variable "vpc_tags" {
  description = "List of Tags for the vpc"
  type        = list(string)
  default     = []
}

variable "address_prefixes" {
  description = "List of Prefixes for the vpc"
  type = list(object({
    name     = string
    location = string
    ip_range = string
  }))
  default = []
}

variable "locations" {
  description = "zones per region"
  type        = list(string)
  default     = []
}

variable "subnet_name_prefix" {
  description = "Prefix to the names of subnets"
  type        = string
  default     = "subnet"
}

variable "number_of_addresses" {
  description = "Number of IPV4 Addresses"
  type        = number
  default     = null
}


variable "existing_vpc_name" {
  description = "Name of the Existing VPC to which subnets, gateways are to be attached, only used when `var.create_vpc` is false"
  type        = string
  default     = null
}

variable "create_gateway" {
  description = "True to create new Gateway"
  type        = bool
  default     = false
}

variable "public_gateway_name_prefix" {
  description = "Prefix to the names of the Public Gateways"
  type        = string
  default     = "public_gateway"
}

variable "floating_ip" {
  description = "Floating IP `id`'s or `address`'es that you want to assign to the public gateway"
  type        = map(any)
  default     = {}
}

variable "gateway_tags" {
  description = "List of Tags for the gateway"
  type        = list(string)
  default     = []
}

variable "clean_default_sg_acl" {
  description = "Remove all rules from the default VPC security group and VPC ACL (less permissive)"
  type        = bool
  default     = false
}
