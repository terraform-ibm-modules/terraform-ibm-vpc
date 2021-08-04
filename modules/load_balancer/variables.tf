##############################################################################
# Load Balancer Variables
# Copyright 2020 IBM
##############################################################################

variable create_load_balancer {
  description = "True to create new Load Balancer. False if Load Balancer is already existing and Load Balancer pools/listeners are to be added"
  type        = bool
  default     = true
}

variable name {
  description = "Name of the Load Balancer"
  type        = string
  default     = null
}

##############################################################################


##############################################################################
# Optional Load Balancer Parameters
##############################################################################

variable subnet_ids {
  description = "List of subnet IDs for Load Balancer"
  type        = list(string)
  default     = []
}

variable use_public_load_balancer {
  description = "Use public Load Balancer. If false, a private load balancer will be created."
  type        = bool
  default     = true
}

variable security_group_ids {
  description = "Load Balancer security groups ID list."
  type        = list(string)
  default     = null
}

variable logging {
  description = "Logging of Load Balancer."
  type        = bool
  default     = null
}

variable resource_group_id {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable tags {
  description = "List of Tags for the Load Balancer"
  type        = list(string)
  default     = null
}

##############################################################################


##############################################################################
# Required Pool Variables
##############################################################################

variable pool_name {
  description = "Name for the Load Balncer Pool where instances will be added."
  type        = string
}

variable pool_algorithm {
  description = "Algorithm to be used for Load Balancer Pool. Can be `round_robin`, `weighted_round_robin`, or `least_connections`."
  type        = string
  default     = "round_robin"
  
  validation {
    error_message = "Load Balancer Pool algorithm can only be `round_robin`, `weighted_round_robin`, or `least_connections`."
    condition     = var.pool_algorithm == "round_robin" || var.pool_algorithm == "weighted_round_robin" || var.pool_algorithm == "least_connections"
  }
}

variable pool_protocol {
  description = "Protocol for Load Balancer Pool. Can ve `http`, `https`, or `tcp`."
  type        = string
  default     = "http"

  validation {
    error_message = "Load Balancer Pool Protocol can only be `http`, `https`, or `tcp`."
    condition     = var.pool_protocol == "http" || var.pool_protocol == "https" || var.pool_protocol == "tcp"
  }
}

variable pool_health_delay {
  description = "The Load Balancer Pool health check interval in seconds. Interval must be greater than timeout value."
  type        = number
  default     = 15
}

variable pool_health_retries {
  description = "The Load Balancer Pool health check max retries."
  type       = number
  default     = 10
}

variable pool_health_timeout {
  description = "The Load Balancer Pool health check timeout in seconds."
  type       = number
  default     = 10    
}

variable pool_health_type {
  description = "Protocol for Load Balancer Health Check. Can ve `http`, `https`, or `tcp`."
  type        = string
  default     = "http"

  validation {
    error_message = "Load Balancer Pool Health Check Type can only be `http`, `https`, or `tcp`."
    condition     = var.pool_health_type == "http" || var.pool_health_type == "https" || var.pool_health_type == "tcp"
  }
}

##############################################################################


##############################################################################
# Optional Pool Variables
##############################################################################

variable pool_health_monitor_url {
  description = "Optional. Health Check URL for Load Balancer Pool. This option is only applicable with the `http` health check type."
  type        = string
  default     = null
}

variable pool_health_monitor_port {
  description = "Optional. Load Balancer Pool health check port number."
  type        = number
  default     = null
}

variable pool_proxy_protocol {
  description = "Optional. The proxy protocol setting for the pool that is supported by the load balancers in the application family. Valid values are disabled, v1, and v2. Default value is disabled."
  type        = string
  default     = "disabled"

  validation {
    error_message = "Load Balancer Pool Proxy Protocol can only be `disabled`, `v1`, or `v2`."
    condition     = var.pool_proxy_protocol == "disabled" || var.pool_proxy_protocol == "v1" || var.pool_proxy_protocol == "v2"
  }
}

variable pool_session_persistence_type {
  description = "Optional. Load Balancer Pool Session Persistence type."
  type        = string
  default     = null
}

##############################################################################


##############################################################################
# Load Balancer Pool Member Variables
##############################################################################

variable pool_members {
  description = "List of load balancer pool members. These can be either an IP address or the GUID of a Virtual Server instance"
  type        = list(string)
}

variable pool_member_weights {
  description = "Optional. A list of weights for each of the pool members. This can only be used when the Load Balancer Pool algorithm is `weighted_round_robin`"
  type        = list(number)
  default     = []
}

variable pool_member_port {
  description = "The port number of the application running in the server."
  type        = number
}

##############################################################################


##############################################################################
# Requited Load Balancer Listener Variables
##############################################################################

variable listener_port {
  description = "Listener port number."
  type        = number
}

variable listener_protocol {
  description = "Protocol for Load Balancer Listener. Can ve `http`, `https`, or `tcp`."
  type        = string
  default     = "http"

  validation {
    error_message = "Load Balancer Listener Protocol can only be `http`, `https`, or `tcp`."
    condition     = var.listener_protocol == "http" || var.listener_protocol == "https" || var.listener_protocol == "tcp"
  }
}


##############################################################################


##############################################################################
# Optional Load Balancer Listener Variables
##############################################################################

variable listener_certificate_instance {
  description = "The CRN of the certificate instance, it is applicable(mandatory) only to https protocol."
  type        = string
  default     = null
}

variable listener_accept_proxy_protocol {
  description = "If set to true, listener forwards proxy protocol information that are supported by load balancers in the application family. Default value is false."
  type        = bool
  default     = false
}

variable listener_connection_limit {
  description = "The connection limit of the listener. Valid range is 1 to 15000. Network load balancer do not support connection_limit argument."
  type        = number
  default     = null
}

##############################################################################


##############################################################################
# Load Balancer Policy Variables
##############################################################################

variable listener_policies {
  description = "List of policies to apply to the load balancer listener and rules for each policy"
  type        =  list(object({
      name                    = string
      action                  = string
      priority                = number
      target_id               = string
      target_http_status_code = number
      target_url              = string
      rules                   = list(object({
        name      = string
        condition = string
        type      = string
        field     = string
        value     = string
      }))
  }))
  default    = []
}

##############################################################################