# Public Gateway Example

This module is used to create a Public Gateway

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "public_gateway" {
  source = "terraform-ibm-modules/vpc/ibm//modules/public-gateway"

  name              = var.name
  vpc_id            = data.ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.location
  floating_ip       = var.floating_ip
  tags              = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.79.0, < 3.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_public_gateway.pgw](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_public_gateway) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | Floating IP `id`'s or `address`'es that you want to assign to the public gateway | `map(any)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | location of the Public Gateway | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Public Gateway | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Add user resource tags to the Virtual Private Cloud (VPC) instance to organize, track, and manage costs. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#tag-types). | `list(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_gateway_id"></a> [public\_gateway\_id](#output\_public\_gateway\_id) | The ID of the Public Gateway |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
