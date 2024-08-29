#####################################################
# VPC Address Prefix
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the vpc Address Prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "location" {
  description = "Address Prefix Zone"
  type        = string
}

variable "ip_range" {
  description = "The CIDR block for the address prefix"
  type        = string
}
