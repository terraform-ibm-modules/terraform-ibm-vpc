#####################################################
# Instance Template Configuration Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Instance Template"
  type        = string
}

variable "vpc" {
  description = "VPC name"
  type        = string
}

variable "location" {
  description = "Instance Template zone"
  type        = string
}

variable "image" {
  description = "Image ID for the Instance Template"
  type        = string
}

variable "profile" {
  description = "Profile type for the Instance Template"
  type        = string
}

variable "ssh_keys" {
  description = "List of ssh key IDs to the Instance Template"
  type        = list(string)
}

variable "primary_network_interface" {
  description = "List of primary_network_interface that are to be attached to the Instance Template"
  type = list(object({

    subnet               = string
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
    allow_ip_spoofing    = bool
  }))
}

#####################################################
# Optional Parameters
#####################################################

variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User Data for the Instance Template"
  type        = string
  default     = null
}

variable "volume_attachments" {
  description = "List of volume Attachments that are to be attached to the instance Template"
  type = list(object({
    name                             = string
    volume                           = string
    encryption                       = string
    delete_volume_on_instance_delete = bool
    volume_prototype = list(object({
      profile        = string
      capacity       = number
      iops           = number
      encryption_key = string
    }))
  }))
  default = null
}

variable "network_interfaces" {
  description = "List of network_interfaces that are to be attached to the Instance Template"
  type = list(object({
    subnet               = string
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
    allow_ip_spoofing    = bool
  }))
  default = null
}

variable "boot_volume" {
  description = "List of boot volume that are to be attached to the Instance Template"
  type = list(object({
    name       = string
    encryption = string
  }))
  default = null
}

variable "dedicated_host" {
  description = "Unique Identifier of the Dedicated Host where the instance will be placed"
  type        = string
  default     = null
}

variable "dedicated_host_group" {
  description = "Unique Identifier of the Dedicated Host Group where the instance will be placed"
  type        = string
  default     = null
}