#####################################################
# VPN Gateway Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the VPN Gateway"
  type        = string
}

variable "subnet" {
  description = "Subnet id for the Gateway"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################

variable "resource_group_id" {
  description = "ID of resource group."
  type        = string
  default     = null
}

variable "tags" {
  description = "List of Tags for the VPN Gateway"
  type        = list(string)
  default     = []
}