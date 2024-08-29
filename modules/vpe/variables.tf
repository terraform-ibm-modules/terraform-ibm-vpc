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

variable "vpc_id" {
  description = "VPC ID of the new Endpoint Gateway"
  type        = string
  default     = null
}


variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "target" {
  description = "Gateway target"
  type = list(object({
    resource_type = string
    name          = string
    crn           = string
  }))
  default = []
}

variable "ips" {
  description = "Gateway IPs"
  type = list(object({
    id     = string
    name   = string
    subnet = string
  }))
  default = []
}

variable "tags" {
  description = "List of Tags for the Endpoint Gateway"
  type        = list(string)
  default     = []
}


variable "endpoint_gateway" {
  description = "Existing Enpoint Gateway's Name to which Reserved IPs are to be attached"
  type        = string
  default     = null
}


variable "reserved_ips" {
  description = "List of New reserved IPs to the Endpoint Gateway"
  type = list(object({
    reserved_ip = string
  }))
  default = []
}
