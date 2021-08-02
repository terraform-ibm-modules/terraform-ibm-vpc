#####################################################
# Instance Template Module Variables
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Instance Template"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "location" {
  description = "Instance Template zone"
  type        = string
}

variable "image" {
  description = "Image ID for the instance Template"
  type        = string
}

variable "profile" {
  description = "Profile type for the Instance Template"
  type        = string
}

variable "ssh_keys" {
  description = "List of ssh key IDs the instance Template"
  type        = list(string)
}

variable "primary_network_interface" {
  description = "List of primary_network_interface that are to be attached to the instance Template"
  type = list(object({
    subnet               = string
    allow_ip_spoofing    = bool
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
  }))
}

#####################################################
# Optional Parameters
#####################################################

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User Data for the instance Template"
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
  default = []
}

variable "network_interfaces" {
  description = "List of network_interfaces that are to be attached to the instance Template"
  type = list(object({
    subnet               = string
    allow_ip_spoofing    = bool
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
  }))
  default = []
}

variable "boot_volume" {
  description = "List of boot volume that are to be attached to the instance Template"
  type = list(object({
    name       = string
    encryption = string
  }))
  default = []
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