# Module VPC

This example illustrates how to use the `vpc` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | List of Prefixes for the vpc | <pre>list(object({<br>    name     = string<br>    location = string<br>    ip_range = string<br>  }))</pre> | `[]` | no |
| <a name="input_classic_access"></a> [classic\_access](#input\_classic\_access) | Classic Access to the VPC | `bool` | `null` | no |
| <a name="input_create_gateway"></a> [create\_gateway](#input\_create\_gateway) | True to create new Gateway | `bool` | `true` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | True to create new VPC. False if VPC is already existing and subnets or address prefixies are to be added | `bool` | n/a | yes |
| <a name="input_default_address_prefix"></a> [default\_address\_prefix](#input\_default\_address\_prefix) | Default address prefix creation method | `string` | `null` | no |
| <a name="input_default_network_acl_name"></a> [default\_network\_acl\_name](#input\_default\_network\_acl\_name) | Name of the Default ACL | `string` | `null` | no |
| <a name="input_default_routing_table_name"></a> [default\_routing\_table\_name](#input\_default\_routing\_table\_name) | Name of the Default Routing Table | `string` | `null` | no |
| <a name="input_default_security_group_name"></a> [default\_security\_group\_name](#input\_default\_security\_group\_name) | Name of the Default Security Group | `string` | `null` | no |
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | Floating IP `id`'s or `address`'es that you want to assign to the public gateway | `map(any)` | `{}` | no |
| <a name="input_gateway_tags"></a> [gateway\_tags](#input\_gateway\_tags) | List of Tags for the gateway | `list(string)` | `null` | no |
| <a name="input_locations"></a> [locations](#input\_locations) | zones per region | `list(string)` | `[]` | no |
| <a name="input_number_of_addresses"></a> [number\_of\_addresses](#input\_number\_of\_addresses) | Number of IPV4 Addresses | `number` | `null` | no |
| <a name="input_public_gateway_name_prefix"></a> [public\_gateway\_name\_prefix](#input\_public\_gateway\_name\_prefix) | Prefix to the names of Public Gateways | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_routing_table"></a> [routing\_table](#input\_routing\_table) | Routing Table ID | `string` | `null` | no |
| <a name="input_subnet_access_control_list"></a> [subnet\_access\_control\_list](#input\_subnet\_access\_control\_list) | Network ACL ID | `string` | `null` | no |
| <a name="input_subnet_name_prefix"></a> [subnet\_name\_prefix](#input\_subnet\_name\_prefix) | Name of the subnet | `string` | `null` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | ID of the Existing VPC to which subnets, gateways are to be attached | `string` | `null` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the vpc | `string` | `null` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | List of tags. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_gateway_ids"></a> [public\_gateway\_ids](#output\_public\_gateway\_ids) | The IDs of the Public Gateways |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | The IDs of the subnets |
| <a name="output_vpc_address_prefixes"></a> [vpc\_address\_prefixes](#output\_vpc\_address\_prefixes) | The Address Prefixes of the VPC |
| <a name="output_vpc_address_prefixes_cidr"></a> [vpc\_address\_prefixes\_cidr](#output\_vpc\_address\_prefixes\_cidr) | The Address Prefix CIDRs of the VPC |
| <a name="output_vpc_default_network_acl"></a> [vpc\_default\_network\_acl](#output\_vpc\_default\_network\_acl) | The ID of the vpc default network acl |
| <a name="output_vpc_default_routing_table"></a> [vpc\_default\_routing\_table](#output\_vpc\_default\_routing\_table) | The ID of the vpc default Routing Table |
| <a name="output_vpc_default_security_group"></a> [vpc\_default\_security\_group](#output\_vpc\_default\_security\_group) | The ID of the vpc default security group |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the vpc |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a VPC by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.