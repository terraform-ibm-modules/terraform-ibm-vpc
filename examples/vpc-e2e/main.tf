#####################################################
# VPCEnd to End Template Configuration
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "vpc" {
  source = "../../modules/vpc"

  create_vpc = true
  vpc_name   = "${var.vpc_prefix}-vpc"
}

module "subnet" {
  source = "../../modules/subnet"

  name                = "${var.vpc_prefix}-subnet"
  vpc_id              = module.vpc.vpc_id[0]
  location            = var.location
  number_of_addresses = var.number_of_addresses
}

module "vpe" {
  source = "../../modules/vpe"

  create_endpoint_gateway = true
  name                    = "${var.vpc_prefix}-endpoint"
  vpc_id                  = module.vpc.vpc_id[0]
  target                  = local.endpoint_target
}

module "vpn_gateway" {
  source = "../../modules/vpn-gateway"

  create_vpn_gateway = true
  name               = "${var.vpc_prefix}-vpc-gateway"
  subnet             = module.subnet.subnet_id
}

module "volume" {
  source = "../../modules/volume"

  name           = "${var.vpc_prefix}-volume"
  location       = var.location
  volume_profile = var.volume_profile
}

module "ssh-key" {
  source = "../../modules/ssh-key"

  name       = "${var.vpc_prefix}-ssh-key"
  public_key = var.public_key
}

module "security_group" {
  source = "../../modules/security-group"

  create_security_group = true
  name                  = "${var.vpc_prefix}-sg"
  vpc_id                = module.vpc.vpc_id[0]
}

module "public_gateway" {
  source = "../../modules/public-gateway"

  name     = "${var.vpc_prefix}-public-gw"
  vpc_id   = module.vpc.vpc_id[0]
  location = var.location
}

module "network_acl" {
  source = "../../modules/network-acl"

  name   = "${var.vpc_prefix}-network-acl"
  vpc_id = module.vpc.vpc_id[0]
}

module "load-balancer" {
  source = "../../modules/load-balancer"

  create_load_balancer = true
  name                 = "${var.vpc_prefix}-lb"
  subnets              = [module.subnet.subnet_id]
}

module "instance" {
  source = "../../modules/instance"

  name                      = "${var.vpc_prefix}-vsi"
  vpc_id                    = module.vpc.vpc_id[0]
  location                  = var.location
  image                     = var.image
  profile                   = var.profile
  ssh_keys                  = [module.ssh-key.ssh_key_id]
  primary_network_interface = local.primary_network_interface
}

module "image" {
  source = "../../modules/image"

  name             = "${var.vpc_prefix}-image"
  href             = var.href
  operating_system = var.operating_system
}

module "fip" {
  source = "../../modules/floatingIP"

  name     = "${var.vpc_prefix}-fip"
  location = var.location
}
