#####################################################
# VPN Gateway Connection Module Example Parameters
# Copyright 2020 IBM
#####################################################

variable "vpn_gateway_connection_name" {
  description = "Name of the VPN Gateway Connection"
  type        = string
}

variable "vpn_gateway_id" {
  description = "VPN Gateway ID"
  type        = string
}

variable "peer_gateway_address" {
  description = "The IP address of the peer VPN gateway"
  type        = string
}

variable "preshared_key" {
  description = "The preshared key"
  type        = string
}

variable "local_cidrs" {
  description = "List of local CIDRs for this resource"
  type        = list(string)
}

variable "peer_cidrs" {
  description = "List of peer CIDRs for this resource"
  type        = list(string)
}

#####################################################
# Optional Parameters
#####################################################


variable "admin_state_up" {
  description = "The VPN gateway connection status"
  type        = bool
  default     = null
}

variable "action" {
  description = "Dead peer detection actions"
  type        = string
  default     = null
}

variable "interval" {
  description = "Dead peer detection interval in seconds"
  type        = number
  default     = null
}

variable "timeout" {
  description = "Dead peer detection timeout in seconds"
  type        = number
  default     = null
}

variable "ike_policy" {
  description = "The ID of the IKE policy"
  type        = string
  default     = null
}

variable "ipsec_policy" {
  description = " The ID of the IPSec policy"
  type        = string
  default     = null
}
