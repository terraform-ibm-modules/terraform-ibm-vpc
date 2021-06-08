#####################################################
# Custom Image Configuration Example
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "image" {
  // source = "terraform-ibm-modules/vpc/ibm//modules/image"
  source = "../../modules/image"

  name               = var.name
  resource_group_id  = data.ibm_resource_group.resource_group.id
  href               = var.href
  operating_system   = var.operating_system
  encrypted_data_key = var.encrypted_data_key
  encryption_key     = var.encryption_key
  tags               = var.tags
}