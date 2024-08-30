#####################################################
# Load Balancer Variables
# Copyright 2020 IBM
#####################################################

variable "create_load_balancer" {
  description = "True to create new Load Balancer. False if Load Balancer is already existing and Load Balancer pools/listeners are to be added"
  type        = bool
}

#####################################################
# Optional Parameters
#####################################################

variable "name" {
  description = "Name of the Load Balancer"
  type        = string
  default     = null
}

variable "subnets" {
  description = "Load Balancer subnets list"
  type        = list(string)
  default     = []
}

variable "type" {
  description = "Type of Load balancer"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "Load Balancer securitygroups list"
  type        = list(string)
  default     = null
}

variable "profile" {
  description = "The profile to use for this load balancer. Conflicts with 'logging'"
  type        = string
  default     = null
}

variable "logging" {
  description = "Logging of Load Balancer. Conflicts with 'profile'"
  type        = bool
  default     = null
}

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "tags" {
  description = "List of Tags for the Load Balancer"
  type        = list(string)
  default     = null
}


variable "load_balancer" {
  description = "Existing Load Balancer's name to which pools/listeners are to be attached."
  type        = string
  default     = null
}

variable "lb_pools" {
  description = "List of Load Balancer Pool"
  type = list(object({
    name                                = string
    algorithm                           = string
    protocol                            = string
    health_delay                        = number
    health_retries                      = number
    health_timeout                      = number
    health_type                         = string
    health_monitor_url                  = string
    health_monitor_port                 = number
    session_persistence_type            = string
    session_persistence_app_cookie_name = string
    proxy_protocol                      = string
    lb_pool_members = list(object({
      port           = number
      target_address = string
      target_id      = string
      weight         = number
    }))
  }))
  default = []
}


variable "lb_listeners" {
  description = "List of Load Balancer Listeners"
  type = list(object({
    port                  = number
    protocol              = string
    default_pool          = string
    certificate_instance  = string
    connection_limit      = number
    accept_proxy_protocol = bool
    lb_listener_policies = list(object({
      name                    = string
      action                  = string
      priority                = number
      target_id               = string
      target_http_status_code = number
      target_url              = string
      rules = object({
        condition = string
        type      = string
        field     = string
        value     = string
      })
      lb_listener_policy_rules = list(object({
        name      = string
        condition = string
        type      = string
        field     = string
        value     = string
      }))
    }))
  }))
  default = []
}