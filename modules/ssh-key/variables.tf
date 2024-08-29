#####################################################
# SSH Key Configuartionn Variables
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the SSH Key"
  type        = string
}

variable "public_key" {
  description = "SSH Public key data"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################

variable "resource_group_id" {
  description = "ID of resource group."
  type        = string
  default     = null
}

variable "tags" {
  description = "List of Tags for the SSH Key"
  type        = list(string)
  default     = null
}