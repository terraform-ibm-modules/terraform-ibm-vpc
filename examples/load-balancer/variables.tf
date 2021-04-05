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
  default     = []
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

variable "resource_group" {
  description = "Resource group Name"
  type        = string
  default     = null
}

variable "tags" {
  description = "List of Tags for the Load Balancer"
  type        = list(string)
  default     = []
}


variable "load_balancer" {
  description = "Existing Load Balancer's ID to which pools/listeners are to be attached."
  type        = string
}

variable "lb_pools" {
  description = "List of Load Balancer Pool"
  default     = []
}


variable "lb_pool_members" {
  description = "List of Load Balancer Pool Members"
  default     = []
}


variable "lb_listeners" {
  description = "List of Load Balancer Listeners"
  default     = []
}



variable "lb_listener_policies" {
  description = "List of Load Balancer Listener Policies"
  default     = []
}


variable "lb_listener_policy_rules" {
  description = "List of Load Balancer Listener Policie Rules"
  default     = []
}