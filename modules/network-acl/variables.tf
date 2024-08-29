#####################################################
# Network ACL Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Network ACL"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################


variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
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
  default = []
}

variable "tags" {
  description = "List of Tags for the ACL"
  type        = list(string)
  default     = null
}
