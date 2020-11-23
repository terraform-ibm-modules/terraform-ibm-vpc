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

variable "ip_range" {
  description = "IP range or CIDR block"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################


variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
}

variable "number_of_addresses" {
  description = "Number of IPV4 Addresses"
  type        = number
}

variable "subnet_access_control_list" {
  description = "Network ACL ID"
  type        = string
}

variable "public_gateway" {
  description = "Public Gateway ID"
  type        = string
}