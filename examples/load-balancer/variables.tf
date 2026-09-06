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
  default     = "vpc-lb"
}

variable "resource_group" {
  type        = string
  description = "An existing resource group name to use for this example, if unset a new resource group will be created"
  default     = null
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to be added to created resources"
  default     = []
}

variable "existing_sm_instance_guid" {
  type        = string
  description = "GUID of an existing Secrets Manager instance that has a private certificate engine configured"
}

variable "existing_sm_instance_region" {
  type        = string
  description = "Region of the existing Secrets Manager instance"
}

variable "existing_sm_cert_template" {
  type        = string
  description = "Name of the private certificate template to use when issuing mTLS certificates from the Secrets Manager instance"
}
