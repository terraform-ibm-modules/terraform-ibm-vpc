#####################################################
# Security Group Module Example Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Security Group"
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
  default     = "default"
}