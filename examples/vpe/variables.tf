#####################################################
# Virtual Private Endpoint Resources
# Copyright 2020 IBM
#####################################################

variable "create_endpoint_gateway" {
  description = "True to create new endpoint gateway. False if endpoint gateway is already existing and endpoint gateway ips are to be added"
  type        = bool
}

#####################################################
# Optional Parameters
#####################################################

variable "name" {
  description = "Name of the new Endpoint Gateway"
  type        = string
  default     = null
}

variable "vpc" {
  description = "VPC Name of the new Endpoint Gateway"
  type        = string
  default     = null
}


variable "resource_group" {
  description = "Resource group Name"
  type        = string
  default     = null
}

variable "target" {
  description = "Gateway target"
  default     = []
}

variable "ips" {
  description = "Gateway IPs"
  default     = []
}

variable "tags" {
  description = "List of Tags for the Endpoint Gateway"
  type        = list(string)
  default     = null
}


variable "endpoint_gateway" {
  description = "Existing Enpoint Gateway's Name to which Reserved IPs are to be attached"
  type        = string
  default     = null
}


variable "reserved_ips" {
  description = "List of New reserved IPs to the Endpoint Gateway"
  default     = null
}
