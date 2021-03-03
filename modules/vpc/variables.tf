#####################################################
# VPC
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the vpc"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################

variable "resource_group_id" {
  description = "ID of resource group."
  type        = string
  default     = null
}

variable "classic_access" {
  description = "Classic Access to the VPC"
  type        = bool
  default     = null
}

variable "default_address_prefix" {
  description = "Default address prefix creation method"
  type        = string
  default     = null
}

variable "tags" {
  description = "List of Tags for the vpc"
  type        = list(string)
  default     = []
}