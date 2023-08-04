##############################################################################
# Instance Module Example Parameters
# Copyright 2020 IBM
##############################################################################

variable instance_name {
  description = "Name of the Instance"
  type        = string
}

variable vpc_name {
  description = "VPC name"
  type        = string
}

variable subnet_name {
  description = "Subnet in VPC where instances will be created"
  type        = string
}

variable image_name {
  description = "Name of the image for the VSI"
  type        = string
}

variable profile {
  description = "Profile type for the Instance"
  type        = string
}

variable ssh_key_name {
  description = "Name of SSH key to use when provisioning VSI"
  type        = string
}

##############################################################################


##############################################################################
# Optional Parameters
##############################################################################

variable security_group_ids {
  description = "Optional. A list of security group ids to attach the primary network interface."
  type        = list(string)
  default     = []
}

variable primary_network_interface {
  description = "List of primary_network_interface that are to be attached to the instance"
  type = list(object({
    interface_name       = string
    primary_ipv4_address = string
  }))
}

variable resource_group {
  description = "Resource group name"
  type        = string
  default     = null
}

variable instances {
  description = "number of Instances"
  type        = number
  default     = 1
}

variable user_data {
  description = "User Data for the instance"
  type        = string
  default     = null
}

variable data_volumes {
  description = "List of volume ids that are to be attached to the instance"
  type        = list(string)
  default     = null
}

variable tags {
  description = "List of Tags for the vpc"
  type        = list(string)
  default     = null
}

variable network_interfaces {
  description = "List of network_interfaces that are to be attached to the instance"
  type = list(object({
    subnet               = string
    interface_name       = string
    security_groups      = list(string)
    primary_ipv4_address = string
  }))
  default = null
}

variable boot_volume {
  description = "List of boot volume that are to be attached to the instance"
  type = list(object({
    name       = string
    encryption = string
  }))
  default = null
}