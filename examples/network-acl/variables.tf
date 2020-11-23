#####################################################
# Network ACL Module Example Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Network ACL"
  type        = string
}

variable "vpc" {
  description = "VPC name"
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

variable "rules" {
  description = "List of rules that are to be attached to the Network ACL"
  type = list(object({
    name        = string
    action      = string
    source      = string
    destination = string
    direction   = string
    icmp = object({
      code = number
      type = number
    })
    tcp = object({
      port_max        = number
      port_min        = number
      source_port_max = number
      source_port_min = number
    })
    udp = object({
      port_max        = number
      port_min        = number
      source_port_max = number
      source_port_min = number
    })
  }))
  default = null
}