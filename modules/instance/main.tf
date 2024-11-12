# ##############################################################################
# # Create Virtual Network Interface
# ##############################################################################

resource "ibm_is_virtual_network_interface" "primary_vni" {
  count                     = length(var.primary_network_interface) > 0 && !var.use_legacy_network_interface ? length(var.primary_network_interface) : 0
  subnet                    = var.primary_network_interface[count.index].subnet
  name                      = (var.primary_network_interface[count.index].interface_name != "" ? var.primary_network_interface[count.index].interface_name : null)
  security_groups           = (var.primary_network_interface[count.index].security_groups != null ? var.primary_network_interface[count.index].security_groups : [])
  allow_ip_spoofing         = var.primary_network_interface[count.index].allow_ip_spoofing
  auto_delete               = false
  enable_infrastructure_nat = true
  dynamic "primary_ip" {
    for_each = var.primary_network_interface[count.index].primary_ipv4_address != null ? [1] : []
    content {
      address = var.primary_network_interface[count.index].primary_ipv4_address
    }
  }
}

resource "ibm_is_virtual_network_interface" "additional_vnis" {
  count                     = length(var.network_interfaces) > 0 && !var.use_legacy_network_interface ? length(var.network_interfaces) : 0
  name                      = var.network_interfaces[count.index].interface_name
  subnet                    = var.network_interfaces[count.index].subnet
  allow_ip_spoofing         = var.network_interfaces[count.index].allow_ip_spoofing
  security_groups           = var.network_interfaces[count.index].security_groups
  auto_delete               = false
  enable_infrastructure_nat = true
  dynamic "primary_ip" {
    for_each = var.network_interfaces[count.index].primary_ipv4_address != null ? [1] : []
    content {
      address = var.network_interfaces[count.index].primary_ipv4_address
    }
  }
}

#####################################################
# Instance Resource
# Copyright 2020 IBM
#####################################################

resource "ibm_is_instance" "instances" {
  count          = var.no_of_instances
  name           = "${var.name}-${count.index}"
  vpc            = var.vpc_id
  zone           = var.location
  image          = var.image
  profile        = var.profile
  keys           = var.ssh_keys
  resource_group = var.resource_group_id
  user_data      = (var.user_data != null ? var.user_data : null)
  volumes        = (var.data_volumes != null ? var.data_volumes : [])
  tags           = var.tags

  dynamic "boot_volume" {
    for_each = (var.boot_volume != null ? var.boot_volume : [])
    content {
      name       = (boot_volume.value.name != "" ? boot_volume.value.name : null)
      encryption = (boot_volume.value.encryption != "" ? boot_volume.value.encryption : null)
    }
  }

  # Primary Virtual Network Interface
  dynamic "primary_network_attachment" {
    for_each = var.use_legacy_network_interface ? [] : [1]
    content {
      name = ibm_is_virtual_network_interface.primary_vni[count.index].name
      virtual_network_interface {
        id = ibm_is_virtual_network_interface.primary_vni[count.index].id
      }
    }
  }

  # Additional Virtual Network Interface
  dynamic "network_attachments" {
    # for_each = { for key, value in ibm_is_virtual_network_interface.additional_vnis : key => value if !var.use_legacy_network_interface }
    for_each = length(var.network_interfaces) > 0 && !var.use_legacy_network_interface ? [1] : []
    content {
      name = ibm_is_virtual_network_interface.additional_vnis[count.index].name
      virtual_network_interface {
        id = ibm_is_virtual_network_interface.additional_vnis[count.index].id
      }
    }
  }

  # Legacy Network Interface
  dynamic "primary_network_interface" {
    for_each = var.use_legacy_network_interface ? [1] : []
    content {
      subnet          = var.primary_network_interface[count.index].subnet
      name            = (var.primary_network_interface[count.index].interface_name != "" ? var.primary_network_interface[count.index].interface_name : null)
      security_groups = (var.primary_network_interface[count.index].security_groups != null ? var.primary_network_interface[count.index].security_groups : [])
      dynamic "primary_ip" {
        for_each = var.primary_network_interface[count.index].primary_ipv4_address != null ? [1] : []
        content {
          address = var.primary_network_interface[count.index].primary_ipv4_address
        }
      }
    }
  }

  # Legacy additional Network Interface
  dynamic "network_interfaces" {
    for_each = (var.network_interfaces != null && var.use_legacy_network_interface ? [1] : [])
    content {
      subnet          = var.network_interfaces[count.index].subnet
      name            = (var.network_interfaces[count.index].interface_name != "" ? var.network_interfaces[count.index].interface_name : null)
      security_groups = (var.network_interfaces[count.index].security_groups != null ? var.network_interfaces[count.index].security_groups : [])
      dynamic "primary_ip" {
        for_each = var.network_interfaces[count.index].primary_ipv4_address != null ? [1] : []
        content {
          address = var.network_interfaces[count.index].primary_ipv4_address
        }
      }
    }
  }
}
