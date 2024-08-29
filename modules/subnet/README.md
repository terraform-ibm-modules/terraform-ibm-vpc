# SUBNET Module Example

This module is used to create a Subnet

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "subnet" {
  source = "terraform-ibm-modules/vpc/ibm//modules/subnet"

  name                       = var.name
  vpc_id                     = data.ibm_is_vpc.vpc.id
  resource_group_id          = data.ibm_resource_group.resource_group.id
  location                   = var.location
  ip_range                   = var.ip_range
  number_of_addresses        = var.number_of_addresses
  subnet_access_control_list = var.subnet_access_control_list
  public_gateway             = var.public_gateway
  routing_table              = var.routing_table
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.63.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_subnet.subnet](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | IP range or CIDR block | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | location of the subnet | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the subnet | `string` | n/a | yes |
| <a name="input_number_of_addresses"></a> [number\_of\_addresses](#input\_number\_of\_addresses) | Number of IPV4 Addresses | `number` | `null` | no |
| <a name="input_public_gateway"></a> [public\_gateway](#input\_public\_gateway) | Public Gateway ID | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_routing_table"></a> [routing\_table](#input\_routing\_table) | Routing Table ID | `string` | `null` | no |
| <a name="input_subnet_access_control_list"></a> [subnet\_access\_control\_list](#input\_subnet\_access\_control\_list) | Network ACL ID | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the subnet |
| <a name="output_subnet_ipv4_cidr"></a> [subnet\_ipv4\_cidr](#output\_subnet\_ipv4\_cidr) | IPV4 subnet CIDR block |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
