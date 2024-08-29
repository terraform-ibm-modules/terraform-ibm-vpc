# Floating IP Module Example

This example illustrates how to use the `floatingIP` module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fip"></a> [fip](#module\_fip) | ../../modules/floatingIP | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Floating IP Zone. This conflicts with 'target'. Give only either of one | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Floating IP | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Floating IP | `list(string)` | `null` | no |
| <a name="input_target"></a> [target](#input\_target) | Target Interface ID for this Floating IP. This conflicts with 'zone'. Give only either of one | `string` | `null` | no |

### Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a Floating IP by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
