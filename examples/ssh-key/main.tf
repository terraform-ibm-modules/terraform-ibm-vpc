#####################################################
# SSH Key Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "ssh-key" {
  // source = "terraform-ibm-modules/vpc/ibm//modules/ssh-key"
  source = "../../modules/ssh-key"

  name              = var.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  public_key        = var.public_key
  tags              = var.tags
}
