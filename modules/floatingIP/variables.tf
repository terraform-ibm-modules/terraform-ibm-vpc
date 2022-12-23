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

variable "tags" {
  description = "List of Tags for the Floating IP"
  type        = list(string)
  default     = null
}