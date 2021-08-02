#####################################################
# Instance Template Module configuration
# Copyright 2020 IBM
#####################################################

resource "ibm_is_instance_template" "ins_template" {
  name           = var.name
  vpc            = var.vpc_id
  zone           = var.location
  image          = var.image
  profile        = var.profile
  keys           = var.ssh_keys
  resource_group = var.resource_group_id

  dynamic primary_network_interface {
    for_each = var.primary_network_interface
    content {
      subnet               = primary_network_interface.value.subnet
      allow_ip_spoofing    = lookup(primary_network_interface.value, "allow_ip_spoofing", null)
      name                 = (primary_network_interface.value.interface_name != "" ? primary_network_interface.value.interface_name : null)
      security_groups      = (primary_network_interface.value.security_groups != null ? primary_network_interface.value.security_groups : [])
      primary_ipv4_address = (primary_network_interface.value.primary_ipv4_address != "" ? primary_network_interface.value.primary_ipv4_address : null)
    }
  }

  dynamic network_interfaces {
    for_each = (var.network_interfaces != null ? var.network_interfaces : [])
    content {
      subnet               = network_interfaces.value.subnet
      allow_ip_spoofing    = lookup(network_interfaces.value, "allow_ip_spoofing", null)
      name                 = (network_interfaces.value.interface_name != "" ? network_interfaces.value.interface_name : null)
      security_groups      = (network_interfaces.value.security_groups != null ? network_interfaces.value.security_groups : [])
      primary_ipv4_address = (network_interfaces.value.primary_ipv4_address != "" ? network_interfaces.value.primary_ipv4_address : null)
    }
  }
  dynamic boot_volume {
    for_each = (var.boot_volume != null ? var.boot_volume : [])
    content {
      name                             = (boot_volume.value.name != "" ? boot_volume.value.name : null)
      encryption                       = (boot_volume.value.encryption != "" ? boot_volume.value.encryption : null)
      delete_volume_on_instance_delete = lookup(boot_volume.value, "delete_volume_on_instance_delete", null)
    }
  }
  dynamic volume_attachments {
    for_each = (var.volume_attachments != null ? var.volume_attachments : [])
    content {
      delete_volume_on_instance_delete = volume_attachments.value.delete_volume_on_instance_delete
      name                             = (volume_attachments.value.name != "" ? volume_attachments.value.name : null)
      volume                           = (volume_attachments.value.volume != "" ? volume_attachments.value.volume : null)
      encryption                       = (volume_attachments.value.encryption != "" ? volume_attachments.value.encryption : null)

      dynamic volume_prototype {
        for_each = lookup(volume_attachments.value, "volume_prototype") == null ? [] : [volume_attachments.value.volume_prototype]
        content {
          profile        = volume_prototype.value.profile
          capacity       = volume_prototype.value.capacity
          iops           = lookup(volume_prototype.value, "iops", null)
          encryption_key = lookup(volume_prototype.value, "encryption_key", null)
        }
      }
    }
  }
  user_data            = (var.user_data != null ? var.user_data : null)
  dedicated_host       = (var.dedicated_host != null ? var.dedicated_host : null)
  dedicated_host_group = (var.dedicated_host_group != null ? var.dedicated_host_group : null)
}