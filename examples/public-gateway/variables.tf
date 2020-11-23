#####################################################
# Public Gateway Module Example Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Public Gateway"
  type        = string
}

variable "vpc" {
  description = "VPC name"
  type        = string
}

variable "location" {
  description = "Public Gateway Zone"
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

variable "floating_ip" {
  description = "Floating IP `id`'s or `address`'es that you want to assign to the public gateway"
  type        = map(list(string))
  default     = null
}

variable "tags" {
  description = "List of Tags for the Volume"
  type        = list(string)
  default     = null
}