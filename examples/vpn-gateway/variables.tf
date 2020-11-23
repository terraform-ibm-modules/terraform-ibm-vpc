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

variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = null
}

variable "tags" {
  description = "List of tags."
  type        = list(string)
  default     = null
}