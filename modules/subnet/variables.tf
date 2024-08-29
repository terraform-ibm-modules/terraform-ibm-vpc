#####################################################
# Subnet Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the subnet"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "location" {
  description = "location of the subnet"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################

variable "ip_range" {
  description = "IP range or CIDR block"
  type        = string
  default     = null
}

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "number_of_addresses" {
  description = "Number of IPV4 Addresses"
  type        = number
  default     = null
}

variable "subnet_access_control_list" {
  description = "Network ACL ID"
  type        = string
  default     = null
}

variable "public_gateway" {
  description = "Public Gateway ID"
  type        = string
  default     = null
}

variable "routing_table" {
  description = "Routing Table ID"
  type        = string
  default     = null
}