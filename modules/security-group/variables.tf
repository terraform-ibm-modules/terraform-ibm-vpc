#####################################################
# Security Group Parameters
# Copyright 2020 IBM
#####################################################

variable "create_security_group" {
  description = "True to create new security group. False if security group is already existing and security group rules are to be added"
  type        = bool
}

#####################################################
# Optional Parameters
#####################################################

variable "name" {
  description = "Name of the new Security Group"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "VPC ID of the new security group"
  type        = string
  default     = null
}


variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "security_group" {
  description = "Existing Security Group's name to which rules are to be attached."
  type        = string
  default     = null
}

variable "security_group_rules" {
  description = "Security Group rules"
  type = list(object({
    name       = string
    direction  = string
    remote     = string
    ip_version = optional(string)
    icmp = optional(object({
      code = number
      type = number
    }))
    tcp = optional(object({
      port_max = number
      port_min = number
    }))
    udp = optional(object({
      port_max = number
      port_min = number
    }))
  }))
  default = []
}
