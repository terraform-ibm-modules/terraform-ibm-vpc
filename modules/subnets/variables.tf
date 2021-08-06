##############################################################################
# Subnet Parameters
# Copyright 2020 IBM
##############################################################################

variable prefix {
  description = "Prefix to be added to the beginning of each subnet name"
  type        = string
}

variable vpc_id {
  description = "ID of VPC where subnets will be created"
  type        = string
}

variable region {
  description = "Region where VPC will be created"
  type        = string
  default     = "us-south"
}

variable subnets {
  description = "List of subnets for the vpc. For each item in each array, a subnet will be created. Items can be either CIDR blocks or total ipv4 addressess"
  type        = object({
    zone-1 = list(string)
    zone-2 = list(string)
    zone-3 = list(string)
  })
  default = {
    zone-1 = ["10.90.10.0/24", "10.110.10.0/24"],
    zone-2 = [256],
    zone-3 = ["10.70.10.0/24", 256]
  }
}

##############################################################################


##############################################################################
# Optional Subnet Creation Variables
##############################################################################

variable create_subnet_prefixes {
  description = "Create prefixes on the VPC for subnets"
  type        = bool
  default     = true
}

variable resource_group_id {
  description = "Optional. Resource group ID"
  type        = string
  default     = null
}

variable public_gateways {
  description = "Optional. A map of public gateway IDs. To not use a gateway in a specific zone, leave string empty. If public gateway IDs are provided, they will be used by any subnet created in the zone."
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

variable routing_table_id {
  description = "Optional. Routing Table ID"
  type        = string
  default     = null
}

variable acl_id {
  description = "Optional. ACL ID to use for subnet creation"
  type        = string
  default     = null
}


##############################################################################
 

##############################################################################
# Subnet Data Variables
##############################################################################

variable subnet_names {
  description = "Optional. A list of subnet names to get from data blocks"
  type        = list(string)
  default     = []
}

##############################################################################