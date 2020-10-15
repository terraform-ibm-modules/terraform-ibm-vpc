#####################################################
# Security Group Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Security Group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################


variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
}