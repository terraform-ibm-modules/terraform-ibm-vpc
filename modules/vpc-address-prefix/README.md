# Module VPC Address Prefix

This module is used to create a VPC Address Prefix

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

module "vpc-address-prefix" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpc-address-prefix"

  name     = var.name
  vpc_id   = data.ibm_is_vpc.vpc.id
  location = var.location
  ip_range = var.ip_range
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_is_vpc_address_prefix.vpc_address_prefix](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/resources/is_vpc_address_prefix) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | The CIDR block for the address prefix | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Address Prefix Zone | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the vpc Address Prefix | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_address_prefix_id"></a> [vpc\_address\_prefix\_id](#output\_vpc\_address\_prefix\_id) | The ID of the vpc Address Prefix |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
