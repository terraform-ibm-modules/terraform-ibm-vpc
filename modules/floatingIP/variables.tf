#####################################################
# Floating IP Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Floating IP"
  type        = string
}

variable "location" {
  description = "Floating IP Zone"
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

variable "target" {
  description = "Target Interface ID for this Floating IP"
  type        = string
  default     = null
}

variable "resource_tags" {
  description = "Add user resource tags to the Virtual Private Cloud (VPC) instance to organize, track, and manage costs. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#tag-types)."
  type        = list(string)
  default     = null
}
