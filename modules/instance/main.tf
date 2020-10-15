#####################################################
# Instance Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_instance" "testacc_instance" {
  name           = var.name
  vpc            = var.vpc_id
  zone           = var.location
  image          = var.image
  profile        = var.profile
  keys           = var.ssh_keys
  resource_group = var.resource_group_id
  user_data      = var.user_data
  volumes        = var.data_volumes
  tags           = var.tags
  dynamic primary_network_interface {
    for_each = var.primary_network_interface
    content {
      subnet               = primary_network_interface.value.subnet
      name                 = (primary_network_interface.value.interface_name != "" ? primary_network_interface.value.interface_name : null)
      security_groups      = (primary_network_interface.value.security_groups != "" ? primary_network_interface.value.security_groups : null)
      primary_ipv4_address = (primary_network_interface.value.primary_ipv4_address != "" ? primary_network_interface.value.primary_ipv4_address : null)
    }
  }
  dynamic network_interfaces {
    for_each = var.network_interfaces
    content {
      subnet               = network_interfaces.value.subnet
      name                 = (network_interfaces.value.interface_name != "" ? network_interfaces.value.interface_name : null)
      security_groups      = (network_interfaces.value.security_groups != "" ? network_interfaces.value.security_groups : null)
      primary_ipv4_address = (network_interfaces.value.primary_ipv4_address != "" ? network_interfaces.value.primary_ipv4_address : null)
    }
  }
  dynamic boot_volume {
    for_each = var.boot_volume
    content {
      name       = (boot_volume.value.name != "" ? boot_volume.value.name : null)
      encryption = (boot_volume.value.encryption != "" ? boot_volume.value.encryption : null)
    }
  }
}