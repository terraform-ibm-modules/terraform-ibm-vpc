########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.1.6"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# COS instance
########################################################################################################################

module "vpc" {
  source            = "../.."
  resource_group_id = module.resource_group.resource_group_id
  vpc_name          = "soaib-vpc0"
  locations         = [{
    zone = "us-south-1"
    address_prefix = {
      cidr = "192.168.0.0/17"
      name = "us-south-01"
    }
    public_gateway = {
      name = "gateway-01"
    }
    subnets = [{
      name                  = "zone01subnet01"
      ipv4_cidr_block       = "192.168.0.0/18"
      attach_public_gateway = true
      }, {
      name                  = "zone01subnet02"
      ipv4_cidr_block       = "192.168.64.0/19"
    },{
      name                  = "zone01subnet03"
      ipv4_cidr_block       = "192.168.96.0/19"
    }]
    }, {
    zone = "us-south-2"
    address_prefix = {
      name = "us-south-002"
      cidr = "192.168.128.0/18"
    }
    subnets = [{
      name            = "zone02subnet01"
      ipv4_cidr_block = "192.168.128.0/19"
    },{
      name            = "zone02subnet02"
      ipv4_cidr_block = "192.168.160.0/19"
    }]
  }, {
    zone = "us-south-3"
    address_prefix = {
      name = "us-south-003"
      cidr = "192.168.192.0/18"
    }
    subnets = [{
      name = "zone03subnet01"
      ipv4_cidr_block = "192.168.192.0/19"
    }, {
      name = "zone03subnet01"
      ipv4_cidr_block = "192.168.224.0/19"
    }]
  }]
  network_acls      = [{
  name = "nacl-tcp-01"
  rules = [{
    name        = "allow-http-inbound"
    action      = "allow"
    direction   = "inbound"
    source      = "161.10.0.0/16"
    destination = "168.10.0.0/16"
    tcp = {
      port_max        = 80
      port_min        = 80
    }
  }, {
    name        = "allow-http-outbound"
    action      = "allow"
    direction   = "outbound"
    source      = "161.10.0.0/16"
    destination = "168.10.0.0/16"
    tcp = {
      source_port_max = 80
      source_port_min = 80
    }
  }]
}]
}
