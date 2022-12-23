#####################################################
# Instance Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "location" {
  description = "Instance zone"
  type        = string
}

variable "image" {
  description = "Image ID for the instance"
  type        = string
}

variable "profile" {
  description = "Profile type for the Instance"
  type        = string
}

variable "ssh_keys" {
  description = "List of ssh key IDs the instance"
  type        = list(string)
}

variable "primary_network_interface" {
  description = "List of primary_network_interface that are to be attached to the instance"
  type = list(object({
    subnet               = string
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
  }))
}

#####################################################
# Optional Parameters
#####################################################

variable "no_of_instances" {
  description = "number of Instances"
  type        = number
  default     = 1
}

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User Data for the instance"
  type        = string
  default     = null
}

variable "data_volumes" {
  description = "List of volume ids that are to be attached to the instance"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "List of Tags for the Instance"
  type        = list(string)
  default     = null
}

variable "network_interfaces" {
  description = "List of network_interfaces that are to be attached to the instance"
  type = list(object({
    subnet               = string
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
  }))
  default = []
}

variable "boot_volume" {
  description = "List of boot volume that are to be attached to the instance"
  type = list(object({
    name       = string
    encryption = string
  }))
  default = []
}