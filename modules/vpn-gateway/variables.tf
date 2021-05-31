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

variable "vpn_gateway" {
  description = "Existing Gateway ID to which connections are to be attached"
  type        = string
  default     = null
}


variable "connections" {
  description = "List of connections for the VPN Gateway"
  type = list(object({
    name           = string
    peer_address   = string
    preshared_key  = string
    local_cidrs    = list(string)
    peer_cidrs     = list(string)
    admin_state_up = bool
    action         = string
    interval       = number
    timeout        = number
    ike_policy     = string
    ipsec_policy   = string
  }))
  default = []
}