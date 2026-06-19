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
  default     = null
}

variable "floating_ip" {
  description = "Floating IP `id`'s or `address`'es that you want to assign to the public gateway"
  type        = map(any)
  default     = {}
}

variable "resource_tags" {
  description = "Add user resource tags to the Virtual Private Cloud (VPC) instance to organize, track, and manage costs. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#tag-types)."
  type        = list(string)
  default     = null
}
