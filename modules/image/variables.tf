#####################################################
# Image Parameters
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the Image"
  type        = string
}

variable "href" {
  description = "Image Href value"
  type        = string
}

variable "operating_system" {
  description = "Image Operating system"
  type        = string
}

#####################################################
# Optional Parameters
#####################################################

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "encrypted_data_key" {
  description = "A base64-encoded, encrypted representation of the key that was used to encrypt the data for this image"
  type        = string
  default     = null
}

variable "encryption_key" {
  description = "The CRN of the Key Protect Root Key or Hyper Protect Crypto Service Root Key for this resource"
  type        = string
  default     = null
}

variable "resource_tags" {
  description = "Add user resource tags to the Virtual Private Cloud (VPC) instance to organize, track, and manage costs. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#tag-types)."
  type        = list(string)
  default     = null
}
