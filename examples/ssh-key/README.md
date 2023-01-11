# Module SSH Key

This example illustrates how to use the `ssh-key` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ssh-key"></a> [ssh-key](#module\_ssh-key) | ../../modules/ssh-key | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the SSH Key | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | SSH Public key data | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group Name | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the SSH Key | `list(string)` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a SSH Key by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.