# ########################################################################################################################
# # Input Variables
# ########################################################################################################################

variable "create_vpc" {
  description = "Indicates whether user wants to use an existing vpc or create a new one. Set it to true to create a new vpc"
  type        = bool
  default     = true
}

variable "existing_vpc_id" {
  description = "The ID of the existing vpc. Required if 'create_vpc' is false."
  type        = string
  default     = null
}

variable "resource_group_id" {
  description = "The resource group ID where the VPC to be created."
  type        = string
}

variable "vpc_name" {
  description = "Name of the vpc"
  type        = string
  default     = null
}

variable "enable_classic_access" {
  description = "Set to true to create a VPC that can connect to classic infrastructure resources."
  type        = bool
  default     = false
}

variable "auto_assign_address_prefix" {
  description = "Set to true to create a default address prefix automatically for each zone in the VPC."
  type        = bool
  default     = true
}

variable "default_network_acl_name" {
  description = "Name of the default network access control list (ACL)."
  type        = string
  default     = null
}

variable "default_security_group_name" {
  description = "Name of the Default Security Group"
  type        = string
  default     = null
}

variable "default_routing_table_name" {
  description = "Name of the Default Routing Table"
  type        = string
  default     = null
}

variable "clean_default_sg_acl" {
  description = "Remove all rules from the default VPC security group and VPC ACL (less permissive)"
  type        = bool
  default     = false
}

variable "vpc_tags" {
  description = "List of tags to associate with the VPC."
  type        = list(string)
  default     = []
}


# #####################################################
# # optional Parameters
# #####################################################

variable "locations" {
  description = "A list of location configurations, each defining details for a specific zone. Each location may include address prefixes, public gateway settings, and subnet configurations."
  type = list(object({
    zone = string
    address_prefix = optional(object({
      name = optional(string, null)
      cidr = string
    }), null)

    public_gateway = optional(object({
      name        = optional(string, null)
      floating_ip = optional(map(string), null)
      tags        = optional(list(string), [])
    }), null)

    subnets = optional(list(object({
      name                  = string
      access_tags           = optional(list(string), [])
      ipv4_cidr_block       = string
      network_acl           = optional(string, null)
      attach_public_gateway = optional(bool, false)
      tags                  = optional(list(string), [])
    })), [])
  }))
  default = []
}


##############################################################################
# Network ACLs
##############################################################################

variable "network_acls" {
  description = "The list of ACLs to create. Provide at least one rule for each ACL."
  type = list(
    object({
      name = string
      rules = list(
        object({
          name        = string
          action      = string
          destination = string
          direction   = string
          source      = string
          tcp = optional(
            object({
              port_max        = optional(number)
              port_min        = optional(number)
              source_port_max = optional(number)
              source_port_min = optional(number)
            })
          )
          udp = optional(
            object({
              port_max        = optional(number)
              port_min        = optional(number)
              source_port_max = optional(number)
              source_port_min = optional(number)
            })
          )
          icmp = optional(
            object({
              type = optional(number)
              code = optional(number)
            })
          )
        })
      )
    })
  )

  default = []

  validation {
    error_message = "ACL rule actions can only be `allow` or `deny`."
    condition = length(distinct(
      flatten([
        # Check through rules
        for rule in flatten([var.network_acls[*].rules]) :
        # Return false action is not valid
        false if !contains(["allow", "deny"], rule.action)
      ])
    )) == 0
  }

  validation {
    error_message = "ACL rule direction can only be `inbound` or `outbound`."
    condition = length(distinct(
      flatten([
        # Check through rules
        for rule in flatten([var.network_acls[*].rules]) :
        # Return false if direction is not valid
        false if !contains(["inbound", "outbound"], rule.direction)
      ])
    )) == 0
  }

  validation {
    error_message = "ACL rule names must match the regex pattern ^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$."
    condition = length(distinct(
      flatten([
        # Check through rules
        for rule in flatten([var.network_acls[*].rules]) :
        # Return false if direction is not valid
        false if !can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$", rule.name))
      ])
    )) == 0
  }
}


##############################################################################
# Default Security Group Rules
##############################################################################

variable "default_security_group_rules" {
  description = "A list of security group rules to be added to the default vpc security group (default empty)"
  default     = []
  type = list(
    object({
      name      = string
      direction = string
      remote    = string
      tcp = optional(
        object({
          port_max = optional(number)
          port_min = optional(number)
        })
      )
      udp = optional(
        object({
          port_max = optional(number)
          port_min = optional(number)
        })
      )
      icmp = optional(
        object({
          type = optional(number)
          code = optional(number)
        })
      )
    })
  )

  validation {
    error_message = "Security group rule direction can only be `inbound` or `outbound`."
    condition = (var.default_security_group_rules == null || length(var.default_security_group_rules) == 0) ? true : length(distinct(
      flatten([
        # Check through rules
        for rule in var.default_security_group_rules :
        # Return false if direction is not valid
        false if !contains(["inbound", "outbound"], rule.direction)
      ])
    )) == 0
  }

  validation {
    error_message = "Security group rule names must match the regex pattern ^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$."
    condition = (var.default_security_group_rules == null || length(var.default_security_group_rules) == 0) ? true : length(distinct(
      flatten([
        # Check through rules
        for rule in var.default_security_group_rules :
        # Return false if direction is not valid
        false if !can(regex("^([a-z]|[a-z][-a-z0-9]*[a-z0-9])$", rule.name))
      ])
    )) == 0
  }
}

##############################################################################
