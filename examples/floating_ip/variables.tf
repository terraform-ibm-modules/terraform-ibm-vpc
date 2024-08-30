##############################################################################
# Floating IP Parameters
# Copyright 2020 IBM
##############################################################################

variable name {
  description = "Name of the Floating IP"
  type        = string
}

##############################################################################


##############################################################################
# Optional Parameters
##############################################################################

variable resource_group {
  description = "Resource group name"
  type        = string
  default     = null
}

variable zone {
  description = "Floating IP Zone. This conflicts with 'target'. Give only either of one"
  type        = string
  default     = null
}

variable target {
  description = "Target Interface ID for this Floating IP. This conflicts with 'zone'. Give only either of one"
  type        = string
  default     = null
}

variable tags {
  description = "List of Tags for the Floating IP"
  type        = list(string)
  default     = null
}

##############################################################################