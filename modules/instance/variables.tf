##############################################################################
# Instance Parameters
# Copyright 2020 IBM
##############################################################################

variable name {
  description = "Name of the Instance"
  type        = string
}

variable image_id {
  description = "Image ID for the instance"
  type        = string
}

variable profile {
  description = "Profile type for the Instance. Use `ibmcloud is instance-profiles` for a list of instance profiles"
  type        = string
}

variable ssh_key_ids {
  description = "List of ssh key IDs for the instance"
  type        = list(string)
}

##############################################################################


##############################################################################
# VPC Vairables
# Copyright 2020 IBM
##############################################################################

variable vpc_id {
  description = "VPC ID"
  type        = string
}

variable zone {
  description = "Instance zone"
  type        = string
}

variable subnet_id {
  description = "ID of the subnet where the primary network interface will be attached. The zone of the subnet must match the `zone` variable."
  type        = string
}

##############################################################################


##############################################################################
# Optional Parameters
##############################################################################

variable instances {
  description = "number of Instances"
  type        = number
  default     = 1
  validation {
    error_message = "Must provision at least one instance."
    condition     = var.instnaces > 0
  }
}

variable resource_group_id {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable primary_network_interface {
  description = "Optional. Object detailing primary network interface primary_network_interface that are to be attached to the instance."
  type = object({
    interface_name       = string
    primary_ipv4_address = string
  })
  default = {
    interface_name       = ""
    primary_ipv4_address = ""
  }
}

variable security_group_ids {
  description = "Optional. A list of security group ids to attach the primary network interface."
  type        = list(string)
  default     = []
}

variable user_data {
  description = "User Data for the instance"
  type        = string
  default     = null
}

variable data_volumes {
  description = "List of volume ids that are to be attached to the instance"
  type        = list(string)
  default     = []
}

variable tags {
  description = "List of Tags for the Instance"
  type        = list(string)
  default     = null
}

variable network_interfaces {
  description = "List of network_interfaces that are to be attached to the instance"
  type = list(object({
    subnet_id            = string
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
  }))
  default = []
}

variable boot_volume {
  description = "List of boot volume that are to be attached to the instance"
  type = list(object({
    name       = string
    encryption = string
  }))
  default = []
}

##############################################################################