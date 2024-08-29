# Instance Module Example

This example illustrates how to use the `instance` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.49.0, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instance"></a> [instance](#module\_instance) | ../../modules/instance | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_vpc) | data source |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_volume"></a> [boot\_volume](#input\_boot\_volume) | List of boot volume that are to be attached to the instance | <pre>list(object({<br>    name       = string<br>    encryption = string<br>  }))</pre> | `null` | no |
| <a name="input_data_volumes"></a> [data\_volumes](#input\_data\_volumes) | List of volume ids that are to be attached to the instance | `list(string)` | `null` | no |
| <a name="input_image"></a> [image](#input\_image) | Image ID for the instance | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Instance zone | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Instance | `string` | n/a | yes |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | List of network\_interfaces that are to be attached to the instance | <pre>list(object({<br>    subnet               = string<br>    interface_name       = string<br>    security_groups      = list(string)<br>    primary_ipv4_address = string<br>  }))</pre> | `null` | no |
| <a name="input_no_of_instances"></a> [no\_of\_instances](#input\_no\_of\_instances) | number of Instances | `number` | `1` | no |
| <a name="input_primary_network_interface"></a> [primary\_network\_interface](#input\_primary\_network\_interface) | List of primary\_network\_interface that are to be attached to the instance | <pre>list(object({<br>    subnet               = string<br>    interface_name       = string<br>    security_groups      = list(string)<br>    primary_ipv4_address = string<br>  }))</pre> | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | Profile type for the Instance | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | List of ssh key IDs to the instance | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the vpc | `list(string)` | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User Data for the instance | `string` | `null` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC name | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of primary_network_interface, network_interfaces, boot_volume, tags, ssh_keys, data_volumes to be attached to the instance by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
