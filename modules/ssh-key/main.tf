#####################################################
# SSH Key Resource Configuration
# Copyright 2020 IBM
#####################################################

resource "ibm_is_ssh_key" "ssh_key" {
  name           = var.name
  resource_group = var.resource_group_id
  public_key     = var.public_key
  tags           = (var.tags != null ? var.tags : [])
}