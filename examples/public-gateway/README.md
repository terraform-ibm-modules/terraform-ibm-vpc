# Public Gateway Module Example

This example illustrates how to use the `public_gateway` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_public_gateway"></a> [public\_gateway](#module\_public\_gateway) | ../../modules/public-gateway | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/is_vpc) | data source |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | Floating IP `id`'s or `address`'es that you want to assign to the public gateway | `map(any)` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Public Gateway Zone | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Public Gateway | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Volume | `list(string)` | `null` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


NOTE: We can configure the list of tags, floating_ip to be attached to a the Public Gateway by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.