#####################################################
# Subnet Module Example Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Subnet"
  type        = string
}

variable "vpc" {
  description = "VPC name"
  type        = string
}

variable "location" {
  description = "Subnet Zone"
  type        = string
}


#####################################################
# Optional Parameters
#####################################################

variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = "default"
}

variable "ip_range" {
  description = "IP range or CIDR block. This conflicts with 'number_of_addresses'. Give only either of one"
  type        = string
  default     = null
}

variable "number_of_addresses" {
  description = "Number of IPV4 Addresses. This conflicts with 'ip_range'. Give only either of one"
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