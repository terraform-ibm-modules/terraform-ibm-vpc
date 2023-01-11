# VPC Address Prefix Module Example

This example illustrates how to use the `vpc-address-prefix` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc-address-prefix"></a> [vpc-address-prefix](#module\_vpc-address-prefix) | ../../modules/vpc-address-prefix | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/is_vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | The CIDR block for the address prefix | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Address Prefix Zone | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the vpc Address Prefix | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
