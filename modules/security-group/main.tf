#####################################################
# Security Group Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_security_group" "testacc_sg" {
  name           = var.name
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
}