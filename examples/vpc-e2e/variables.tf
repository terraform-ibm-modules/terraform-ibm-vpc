#####################################################
# VPCEnd to End Template Configuration
# Copyright 2020 IBM
#####################################################

variable "vpc_prefix" {
  description = "Prefix to all the vpc resource names"
  type        = string
  default     = "test-vpc-e2e"
}

variable "location" {
  description = "Zone of the vpc resources"
  type        = string
  default     = "us-south-2"
}

variable "number_of_addresses" {
  description = "Number of IPV4 Addresses. This conflicts with 'ip_range'. Give only either of one"
  type        = number
  default     = 256
}

variable "volume_profile" {
  description = "The profile to use for the volume"
  type        = string
  default     = "10iops-tier"
}

variable "public_key" {
  description = "SSH Public key data"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKVmnMOlHKcZK8tpt3MP1lqOLAcqcJzhsvJcjscgVERRN7/9484SOBJ3HSKxxNG5JN8owAjy5f9yYwcUg+JaUVuytn5Pv3aeYROHGGg+5G346xaq3DAwX6Y5ykr2fvjObgncQBnuU5KHWCECO/4h8uWuwh/kfniXPVjFToc+gnkqA+3RKpAecZhFXwfalQ9mMuYGFxn+fwn8cYEApsJbsEmb0iJwPiZ5hjFC8wREuiTlhPHDgkBLOiycd20op2nXzDbHfCHInquEe/gYxEitALONxm0swBOwJZwlTDOB7C6y2dzlrtxr1L59m7pCkWI4EtTRLvleehBoj3u7jB4usR"
}

variable "image" {
  description = "Image ID for the instance"
  type        = string
  default     = "r006-5b05b4fe-bcbc-4309-ad45-3354813227a0"
}

variable "profile" {
  description = "Profile type for the Instance"
  type        = string
  default     = "cx2-2x4"
}

variable "href" {
  description = "Image Href value"
  type        = string
  default     = "cos://us-south/cosbucket-vpc-image-gen2/rhel-guest-image-7.0-20140930.0.x86_64.qcow2"
}

variable "operating_system" {
  description = "Image Operating system"
  type        = string
  default     = "red-7-amd64"
}
