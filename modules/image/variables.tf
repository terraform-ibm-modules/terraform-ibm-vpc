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

variable "tags" {
  description = "List of Tags for the Image"
  type        = list(string)
  default     = null
}