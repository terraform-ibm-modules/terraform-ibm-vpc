# VPC Block Storage Module Example

This module is used to create a Block Storage (volume)

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "volume" {
  source = "terraform-ibm-modules/vpc/ibm//modules/volume"

  name              = var.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.location
  volume_profile    = var.volume_profile
  iops              = var.iops
  size              = var.size
  encryption        = var.encryption
  tags              = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_volume.volume](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_volume) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encryption"></a> [encryption](#input\_encryption) | The encryption key to use for encrypting this volume | `string` | `null` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | The total i/o operations per sec for the storage. This value is required for custom volume\_profile only. | `number` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Volume Zone | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Volume | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | The capacity of the volume in gigabytes | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the volume | `list(string)` | `null` | no |
| <a name="input_volume_profile"></a> [volume\_profile](#input\_volume\_profile) | The profile to use for this volume | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | The ID of the volume |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
