#####################################################
# Public Gateway Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Public Gateway"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "location" {
  description = "location of the Public Gateway"
  type        = string
}


#####################################################
# Optional Parameters
#####################################################


variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
}

variable "floating_ip" {
  description = "Floating IP `id`'s or `address`'es that you want to assign to the public gateway"
  type        = map(list(string))
}

variable "tags" {
  description = "List of Tags for the Public Gateway"
  type        = list(string)
  default     = []
}