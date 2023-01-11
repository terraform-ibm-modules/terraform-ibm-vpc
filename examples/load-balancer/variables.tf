#####################################################
# Load Balancer Variables
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
  default     = null
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
  description = "Existing Load Balancer's name to which pools/listeners are to be attached."
  type        = string
  default     = null
}

variable "lb_pools" {
  description = "List of Load Balancer Pool"
  default     = []
}

variable "lb_listeners" {
  description = "List of Load Balancer Listeners"
  default     = []
}
