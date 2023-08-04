##############################################################################
# VPC Variables
# Copyright 2020 IBM
##############################################################################

variable create_vpc {
  description = "True to create new VPC. False if VPC is already existing and subnets or address prefixies are to be added"
  type        = bool
  default     = true
}

variable resource_group {
  description = "Name of resource group. If null will use the `default` resource group"
  type        = string
  default     = null
}

variable region {
  description = "Region where VPC will be created"
  type        = string
  default     = "us-south"
}

variable vpc_name {
  description = "Name of the VPC"
  type        = string
}

variable prefix {
  description = "A prefix to be added to the beginning of resources created that are not the VPC"
  type        = string
  default     = "default"
}

##############################################################################


##############################################################################
# Optional VPC Variables
##############################################################################

variable classic_access {
  description = "Classic Access to the VPC. This cannot be added after the VPC is created."
  type        = bool
  default     = false
}

variable auto_prefix_management {
  description = "Indicates whether a default address prefix should be created automatically. If false, address prefixes will be managed manually."
  type        = string
  default     = true
}

variable default_network_acl_name {
  description = "Name of the Default ACL"
  type        = string
  default     = null
}

variable default_security_group_name {
  description = "Name of the Default Security Group"
  type        = string
  default     = null
}

variable default_routing_table_name {
  description = "Name of the Default Routing Table"
  type        = string
  default     = null
}

variable tags {
  description = "List of Tags for the vpc"
  type        = list(string)
  default     = []
}

##############################################################################


##############################################################################
# Address Prefix Variables
##############################################################################

variable address_prefixes {
  description = "List of Prefixes for the vpc"
  type        = object({
    zone-1 = list(string)
    zone-2 = list(string)
    zone-3 = list(string)
  })
  default = {
    zone-1 = [],
    zone-2 = [],
    zone-3 = []
  }
}

##############################################################################


##############################################################################
# Subnet Variables
##############################################################################

variable create_subnets_for_address_prefixes {
  description = "Create a subnet for each of the address prefixes"
  type        = bool
  default     = false
}

variable acl_id {
  description = "Use the ID of an ACL for creation of subnets. Leave empty to use the default vpc acl"
  type        = string
  default     = ""
}

##############################################################################


##############################################################################
# Public Gateway Variables
##############################################################################

variable create_public_gateway {
  description = "If true a public gateway will be created in each zone where an address prefix will be created. If true, all subnets created will be attached to this gateway."
  type        = bool
  default     = false
}

##############################################################################