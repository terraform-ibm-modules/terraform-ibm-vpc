#####################################################
# VPC
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the vpc"
  type        = string
}

variable "resource_group_id" {
    description = "ID of resource group."
    type        = string
}

variable "classic_access" {
  description = "Classic Access to the VPC"
  type        = bool
}

variable "default_address_prefix" {
  description = "Default address prefix creation method"
  type        = string
}

variable "tags" {
  description = "List of Tags for the vpc"
  type        = list(string)
  default     = []
}