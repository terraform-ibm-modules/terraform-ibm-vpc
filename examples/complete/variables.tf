########################################################################################################################
# Input variables
########################################################################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API Key"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Region to provision all resources created by this example"
  default     = "us-south"
}

variable "prefix" {
  type        = string
  description = "Prefix to append to all resources created by this example"
  default     = "basic"
}

variable "resource_group" {
  type        = string
  description = "The name of an existing resource group to provision resources in to. If not set a new resource group will be created using the prefix variable"
  default     = null
}

variable "vpc_name" {
  description = "Name of the vpc"
  type        = string
  default     = null
}

variable "locations" {
  description = "locations"
  type = list(object({
    zone = string
    address_prefix = optional(object({
      name = optional(string, null)
      cidr = optional(string, null)
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
  default = [{
    zone = "us-south-1"
    address_prefix = {
      cidr = "192.168.0.0/17"
      name = "us-south-01"
    }
    public_gateway = {
      name = "gateway-01"
    }
    subnets = [{
      name                  = "zone01subnet01"
      ipv4_cidr_block       = "192.168.0.0/18"
      attach_public_gateway = true
      }, {
      name            = "zone01subnet02"
      ipv4_cidr_block = "192.168.64.0/19"
      }, {
      name            = "zone01subnet03"
      ipv4_cidr_block = "192.168.96.0/19"
    }]
    }, {
    zone = "us-south-2"
    address_prefix = {
      name = "us-south-002"
      cidr = "192.168.128.0/18"
    }
    subnets = [{
      name            = "zone02subnet01"
      ipv4_cidr_block = "192.168.128.0/19"
      }, {
      name            = "zone02subnet02"
      ipv4_cidr_block = "192.168.160.0/19"
    }]
    }, {
    zone = "us-south-3"
    address_prefix = {
      name = "us-south-003"
      cidr = "192.168.192.0/18"
    }
    subnets = [{
      name            = "zone03subnet01"
      ipv4_cidr_block = "192.168.192.0/19"
      }, {
      name            = "zone03subnet02"
      ipv4_cidr_block = "192.168.224.0/19"
    }]
  }]
}

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

  default = [{
    name = "nacl-tcp-01"
    rules = [{
      name        = "allow-http-inbound"
      action      = "allow"
      direction   = "inbound"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      tcp = {
        port_min = 80
        port_max = 80
      }
      }, {
      name        = "allow-http-outbound"
      action      = "allow"
      direction   = "outbound"
      source      = "0.0.0.0/32"
      destination = "0.0.0.0/32"
      tcp = {
        source_port_min = 80
        source_port_max = 80
      }
    }]
    }, {
    name = "nacl-udp-01"
    rules = [{
      name        = "deny-all-udp-inbound"
      action      = "deny"
      direction   = "inbound"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      udp = {
        port_min = 1
        port_max = 65535
      }
    }]
    }, {
    name = "nacl-icmp-01"
    rules = [{
      name        = "deny-all-icmp-inbound"
      action      = "deny"
      direction   = "inbound"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      icmp = {
        port_min = 1
        port_max = 65535
      }
    }]
  }]
}

variable "default_security_group_rules" {
  description = "A list of security group rules to be added to the default vpc security group (default empty)"
  default = [{
    name      = "http-inbound"
    direction = "inbound"
    remote    = ""
    tcp = {
      port_max = 80
      port_min = 80
    }
  }]
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
}
