#####################################################
# Instance Module Example Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Instance"
  type        = string
}

variable "vpc" {
  description = "VPC name"
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
  description = "List of ssh key IDs to the instance"
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

variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = "default"
}

variable "user_data" {
  description = "User Data for the instance"
  type        = string
  default     = null
}

variable "data_volumes" {
  description = "List of volume ids that are to be attached to the instance"
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "List of Tags for the vpc"
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
  default = null
}

variable "boot_volume" {
  description = "List of boot volume that are to be attached to the instance"
  type = list(object({
    name       = string
    encryption = string
  }))
  default     = null
}