# VPC Block Storage Module Example

This example illustrates how to use the `volume` module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_volume"></a> [volume](#module\_volume) | ../../modules/volume | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encryption"></a> [encryption](#input\_encryption) | The encryption key to use for encrypting this volume | `string` | `null` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | The total i/o operations per sec for the storage. This value is required for custom volume\_profile only. | `number` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Volume Zone | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Volume | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `"default"` | no |
| <a name="input_size"></a> [size](#input\_size) | The capacity of the volume in gigabytes | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Volume | `list(string)` | `null` | no |
| <a name="input_volume_profile"></a> [volume\_profile](#input\_volume\_profile) | The profile to use for this volume | `string` | n/a | yes |

### Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


NOTE: We can configure the list of tags to be attached to a the Volume by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
