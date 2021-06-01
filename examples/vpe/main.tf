#####################################################
# Virtual Private Endpoint Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_is_vpc" "vpc" {
  count = var.create_endpoint_gateway ? 1 : 0
  name  = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "vpe" {
  source = "../../modules/vpe"

  create_endpoint_gateway = var.create_endpoint_gateway
  name                    = var.name
  vpc_id                  = var.create_endpoint_gateway ? data.ibm_is_vpc.vpc[0].id : null
  resource_group_id       = data.ibm_resource_group.resource_group.id
  target                  = var.target
  ips                     = var.ips
  tags                    = var.tags
  endpoint_gateway        = var.endpoint_gateway
  reserved_ips            = var.reserved_ips
}