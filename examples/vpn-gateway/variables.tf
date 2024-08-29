#####################################################
# VPN Gateway Parameters
# Copyright 2020 IBM
#####################################################


variable "create_vpn_gateway" {
  description = "True to create new VPN Gateway. False if VPN Gateway is already existing and VPN Gateway connections are to be added"
  type        = bool
}

#####################################################
# Optional Parameters
#####################################################

variable "name" {
  description = "Name of the VPN Gateway"
  type        = string
  default     = null
}

variable "subnet" {
  description = "Subnet id for the Gateway"
  type        = string
  default     = null
}

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

variable "vpn_gateway" {
  description = "Existing Gateway ID to which connections are to be attached"
  type        = string
  default     = null
}


variable "connections" {
  description = "List of connections for the VPN Gateway"
  default     = []
}
