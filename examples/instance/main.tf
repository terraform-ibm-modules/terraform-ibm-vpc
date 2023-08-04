##############################################################################
# Instance Configuration Example
# Copyright 2020 IBM
##############################################################################

provider ibm {
}

data ibm_resource_group resource_group {
  name = (var.resource_group != null ? var.resource_group : "default")
}

##############################################################################


##############################################################################
# VPC Data
##############################################################################

data ibm_is_vpc vpc {
  name = var.vpc
}

data ibm_is_subnet subnet {
  name = var.subnet_name
}

data ibm_is_image image {
  name = var.image_name
}

data ibm_is_ssh_key ssh_key {
  name = var.ssh_key_name
}

##############################################################################


##############################################################################
# Create Instance
##############################################################################

module instance {
  // source = "terraform-ibm-modules/vpc/ibm//modules/instance"
  source = "../../modules/instance"

  instances                 = var.instances
  name                      = var.name
  vpc_id                    = data.ibm_is_vpc.vpc.id
  resource_group_id         = data.ibm_resource_group.resource_group.id
  subnet_id                 = data.ibm_is_subnet.subnet.id
  zone                      = data.ibm_is_subnet.subnet.zone
  image_id                  = data.ibm_is_image.image.id
  security_group_ids        = var.security_group_ids
  profile                   = var.profile
  ssh_key_ids               = [ data.ibm_is_ssh_key.ssh_key.id ]
  user_data                 = var.user_data
  boot_volume               = var.boot_volume
  network_interfaces        = var.network_interfaces
  data_volumes              = var.data_volumes
  tags                      = var.tags
}

##############################################################################