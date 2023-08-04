##############################################################################
# Subnet Configuration Example
# Copyright 2020 IBM
##############################################################################

provider ibm {
}

data ibm_is_vpc vpc {
  name = var.vpc
}

data ibm_resource_group resource_group {
  name = var.resource_group != null ? var.resource_group : "default"
}

module subnet {
  // source = "terraform-ibm-modules/vpc/ibm//modules/subnet"
  source = "../../modules/subnet"

  name                   = var.name
  vpc_id                 = data.ibm_is_vpc.vpc.id
  resource_group_id      = data.ibm_resource_group.resource_group.id
  prefix                 = var.prefix
  region                 = var.region
  subnets                = var.subnets
  create_subnet_prefixes = var.create_subnet_prefixes
  public_gateways        = var.public_gateways
  routing_table_id       = var.routing_table_id
  acl_id                 = var.acl_id
  subnet_names           = var.subnet_names
}

##############################################################################