##############################################################################
# Public Gateway Parameters
# Copyright 2020 IBM
##############################################################################

variable vpc_id {
  description = "VPC ID"
  type        = string
}

variable zones {
  description = "A list of zones to create public gateways. These zones must be in the VPC region"
  type        = list(string)
  default     = ["us-south-1"]

  validation {
    condition     = length(distinct(var.zones)) == length(var.zones)
    error_message = "Only one gateway can be created in each zone."
  }

  validation {
    condition     = length(var.zones) <= 3 || length(var.zones) >= 1
    error_message = "Public gatways can only be created in 1, 2, or 3 zones in a single region."
  }
}

variable prefix {
  description = "Prefix to add to the beginning of created Public Gateways"
  type        = string
  default     = "pgw"
}

##############################################################################


##############################################################################
# Optional Parameters
##############################################################################


variable resource_group_id {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable floating_ip {
  description = "Optional. Floating IP `id`'s or `address`'es that you want to assign to the public gateway. Leave as empty string to disable."
  type        = object({
    zone-1 = string
    zone-2 = string
    zone-3 = string
  })
  default     = {
    zone-1 = ""
    zone-2 = ""
    zone-3 = ""
  }
}

variable tags {
  description = "Optional. List of Tags for the Public Gateway"
  type        = list(string)
  default     = []
}

variable public_gateway_names {
  description = "Optional. A list of public gateways to get by name"
  type        = list(string)
  default     = []
}

##############################################################################