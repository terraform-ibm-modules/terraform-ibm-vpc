# Module VPC

This module is used to create a VPC

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "vpc" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpc"

  create_vpc                  = var.create_vpc
  vpc_name                    = var.vpc_name
  resource_group_id           = data.ibm_resource_group.resource_group.id
  classic_access              = var.classic_access
  default_address_prefix      = var.default_address_prefix
  default_network_acl_name    = var.default_network_acl_name
  default_security_group_name = var.default_security_group_name
  default_routing_table_name  = var.default_routing_table_name
  vpc_tags                    = var.vpc_tags
  address_prefixes            = var.address_prefixes
  locations                   = var.locations
  subnet_name                 = var.subnet_name
  number_of_addresses         = var.number_of_addresses
  vpc                         = var.vpc
  create_gateway              = var.create_gateway
  public_gateway_name         = var.public_gateway_name
  floating_ip                 = var.floating_ip
  gateway_tags                = var.gateway_tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_public_gateway.pgws](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_public_gateway) | resource |
| [ibm_is_subnet.subnets](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc) | resource |
| [ibm_is_vpc_address_prefix.vpc_address_prefixes](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc_address_prefix) | resource |
| [ibm_is_vpc.vpc_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_vpc) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | List of Prefixes for the vpc | <pre>list(object({<br/>    name     = string<br/>    location = string<br/>    ip_range = string<br/>  }))</pre> | `[]` | no |
| <a name="input_classic_access"></a> [classic\_access](#input\_classic\_access) | Classic Access to the VPC | `bool` | `false` | no |
| <a name="input_clean_default_sg_acl"></a> [clean\_default\_sg\_acl](#input\_clean\_default\_sg\_acl) | Remove all rules from the default VPC security group and VPC ACL (less permissive) | `bool` | `false` | no |
| <a name="input_create_gateway"></a> [create\_gateway](#input\_create\_gateway) | True to create new Gateway | `bool` | `false` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | True to create new VPC. False if VPC is already existing and subnets or address prefixies are to be added | `bool` | `true` | no |
| <a name="input_default_address_prefix"></a> [default\_address\_prefix](#input\_default\_address\_prefix) | Default address prefix creation method | `string` | `"auto"` | no |
| <a name="input_default_network_acl_name"></a> [default\_network\_acl\_name](#input\_default\_network\_acl\_name) | Name of the Default ACL | `string` | `null` | no |
| <a name="input_default_routing_table_name"></a> [default\_routing\_table\_name](#input\_default\_routing\_table\_name) | Name of the Default Routing Table | `string` | `null` | no |
| <a name="input_default_security_group_name"></a> [default\_security\_group\_name](#input\_default\_security\_group\_name) | Name of the Default Security Group | `string` | `null` | no |
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | Floating IP `id`'s or `address`'es that you want to assign to the public gateway | `map(string)` | `{}` | no |
| <a name="input_gateway_tags"></a> [gateway\_tags](#input\_gateway\_tags) | List of Tags for the gateway | `list(string)` | `[]` | no |
| <a name="input_locations"></a> [locations](#input\_locations) | zones per region | `list(string)` | `[]` | no |
| <a name="input_number_of_addresses"></a> [number\_of\_addresses](#input\_number\_of\_addresses) | Number of IPV4 Addresses | `number` | `null` | no |
| <a name="input_public_gateway_name_prefix"></a> [public\_gateway\_name\_prefix](#input\_public\_gateway\_name\_prefix) | Prefix to the names of the Public Gateways | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of resource group. | `string` | `null` | no |
| <a name="input_subnet_name_prefix"></a> [subnet\_name\_prefix](#input\_subnet\_name\_prefix) | Prefix to the names of subnets | `string` | `null` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Name of the Existing VPC to which subnets, gateways are to be attached, only used when `var.create_vpc` is false | `string` | `null` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the vpc | `string` | `null` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | List of Tags for the vpc | `list(string)` | `[]` | no |

### Outputs

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
