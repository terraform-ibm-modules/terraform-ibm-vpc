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

variable "resource_tags" {
  description = "Add user resource tags to the Virtual Private Cloud (VPC) instance to organize, track, and manage costs. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#tag-types)."
  type        = list(string)
  default     = null
}
