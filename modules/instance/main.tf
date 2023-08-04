##############################################################################
# Instance Resource
# Copyright 2020 IBM
##############################################################################

resource ibm_is_instance instances {
  count          = var.instances
  name           = "${var.name}${var.instances == 1 ? "" : "-${count.index + 1}"}"
  vpc            = var.vpc_id
  zone           = var.zone
  image          = var.image_id
  profile        = var.profile
  keys           = var.ssh_key_ids
  resource_group = var.resource_group_id

  primary_network_interface {
    subnet               = var.subnet_id
    name                 = var.primary_network_interface.interface_name == "" ? null : var.primary_network_interface.interface_name
    security_groups      = var.security_group_ids == [] ? null : var.security_group_ids
    primary_ipv4_address = var.primary_network_interface.primary_ipv4_address == "" ? null : var.primary_network_interface.primary_ipv4_address
  }

  user_data = (var.user_data != null ? var.user_data : null)
  volumes   = (var.data_volumes != null ? var.data_volumes : [])
  tags      = var.tags

  dynamic network_interfaces {
    for_each = (var.network_interfaces != null ? var.network_interfaces : [])
    content {
      subnet               = network_interfaces.value.subnet
      name                 = (network_interfaces.value.interface_name != "" ? network_interfaces.value.interface_name : null)
      security_groups      = (network_interfaces.value.security_groups != null ? network_interfaces.value.security_groups : [])
      primary_ipv4_address = (network_interfaces.value.primary_ipv4_address != "" ? network_interfaces.value.primary_ipv4_address : null)
    }
  }

  dynamic boot_volume {
    for_each = (var.boot_volume != null ? var.boot_volume : [])
    content {
      name       = (boot_volume.value.name != "" ? boot_volume.value.name : null)
      encryption = (boot_volume.value.encryption != "" ? boot_volume.value.encryption : null)
    }
  }

}

##############################################################################