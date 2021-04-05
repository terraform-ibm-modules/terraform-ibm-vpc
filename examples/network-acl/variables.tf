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
  default     = null
}

variable "rules" {
  description = "List of rules that are to be attached to the Network ACL"
  default     = []
}

variable "tags" {
  description = "List of Tags for the ACL"
  type        = list(string)
  default     = []
}