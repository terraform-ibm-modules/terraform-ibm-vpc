# SUBNET Module Example

This example illustrates how to use the `subnet` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.49.0, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnet"></a> [subnet](#module\_subnet) | ../../modules/subnet | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_vpc) | data source |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | IP range or CIDR block. This conflicts with 'number\_of\_addresses'. Give only either of one | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Subnet Zone | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Subnet | `string` | n/a | yes |
| <a name="input_number_of_addresses"></a> [number\_of\_addresses](#input\_number\_of\_addresses) | Number of IPV4 Addresses. This conflicts with 'ip\_range'. Give only either of one | `number` | `null` | no |
| <a name="input_public_gateway"></a> [public\_gateway](#input\_public\_gateway) | Public Gateway ID | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_routing_table"></a> [routing\_table](#input\_routing\_table) | Routing Table ID | `string` | `null` | no |
| <a name="input_subnet_access_control_list"></a> [subnet\_access\_control\_list](#input\_subnet\_access\_control\_list) | Network ACL ID | `string` | `null` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC name | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
