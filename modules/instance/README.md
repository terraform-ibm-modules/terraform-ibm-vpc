# Instance Module Example

This module is used to create an Instance

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "instance" {
  source = "terraform-ibm-modules/vpc/ibm//modules/instance"

  number_of_instances           = var.number_of_instances
  name                      = var.name
  vpc_id                    = data.ibm_is_vpc.vpc.id
  resource_group_id         = data.ibm_resource_group.resource_group.id
  location                  = var.location
  image                     = var.image
  profile                   = var.profile
  ssh_keys                  = var.ssh_keys
  primary_network_interface = var.primary_network_interface
  user_data                 = var.user_data
  boot_volume               = var.boot_volume
  network_interfaces        = var.network_interfaces
  data_volumes              = var.data_volumes
  tags                      = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_instance.instances](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_instance) | resource |
| [ibm_is_virtual_network_interface.additional_vnis](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_virtual_network_interface) | resource |
| [ibm_is_virtual_network_interface.primary_vni](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_virtual_network_interface) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_volume"></a> [boot\_volume](#input\_boot\_volume) | List of boot volume that are to be attached to the instance | <pre>list(object({<br/>    name       = string<br/>    encryption = string<br/>  }))</pre> | `[]` | no |
| <a name="input_data_volumes"></a> [data\_volumes](#input\_data\_volumes) | List of volume ids that are to be attached to the instance | `list(string)` | `[]` | no |
| <a name="input_image"></a> [image](#input\_image) | Image ID for the instance | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Instance zone | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Instance | `string` | n/a | yes |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | List of network\_interfaces that are to be attached to the instance | <pre>list(object({<br/>    subnet               = string<br/>    interface_name       = string<br/>    security_groups      = list(string)<br/>    primary_ipv4_address = string<br/>    allow_ip_spoofing    = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_number_of_instances"></a> [number\_of\_instances](#input\_number\_of\_instances) | number of Instances | `number` | `1` | no |
| <a name="input_primary_network_interface"></a> [primary\_network\_interface](#input\_primary\_network\_interface) | List of primary\_network\_interface that are to be attached to the instance | <pre>list(object({<br/>    subnet               = string<br/>    interface_name       = string<br/>    security_groups      = list(string)<br/>    primary_ipv4_address = string<br/>    allow_ip_spoofing    = optional(bool)<br/>  }))</pre> | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | Profile type for the Instance | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | List of ssh key IDs the instance | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Instance | `list(string)` | `null` | no |
| <a name="input_use_legacy_network_interface"></a> [use\_legacy\_network\_interface](#input\_use\_legacy\_network\_interface) | Set this to true to use legacy network interface for the created instances. | `bool` | `false` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User Data for the instance | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_data"></a> [instance\_data](#output\_instance\_data) | Data of all the instances created. |
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | The ID of the Instances |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
