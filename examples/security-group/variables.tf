#####################################################
# Security Group Module Example Parameters
# Copyright 2020 IBM
#####################################################

variable "create_security_group" {
  description = "True to create new security group. False if security group is already existing and security group rules are to be added"
  type        = bool
}

#####################################################
# Optional Parameters
#####################################################

variable "name" {
  description = "Name of the new Security Group"
  type        = string
  default     = null
}

variable "vpc" {
  description = "VPC Name of the new security group"
  type        = string
  default     = null
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = null
}

variable "security_group" {
  description = "Existing Security Group's name to which rules are to be attached."
  type        = string
  default     = null
}


variable "security_group_rules" {
  description = "Security Group rules"
  default     = []
}
