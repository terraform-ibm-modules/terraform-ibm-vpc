# Image Module Example

This module is used to create Image

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "image" {
  source = "terraform-ibm-modules/vpc/ibm//modules/image"

  name               = var.name
  resource_group_id  = data.ibm_resource_group.resource_group.id
  href               = var.href
  operating_system   = var.operating_system
  encrypted_data_key = var.encrypted_data_key
  encryption_key     = var.encryption_key
  tags               = var.tags
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
| [ibm_is_image.image](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_image) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encrypted_data_key"></a> [encrypted\_data\_key](#input\_encrypted\_data\_key) | A base64-encoded, encrypted representation of the key that was used to encrypt the data for this image | `string` | `null` | no |
| <a name="input_encryption_key"></a> [encryption\_key](#input\_encryption\_key) | The CRN of the Key Protect Root Key or Hyper Protect Crypto Service Root Key for this resource | `string` | `null` | no |
| <a name="input_href"></a> [href](#input\_href) | Image Href value | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Image | `string` | n/a | yes |
| <a name="input_operating_system"></a> [operating\_system](#input\_operating\_system) | Image Operating system | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Image | `list(string)` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_id"></a> [image\_id](#output\_image\_id) | The ID of the Image |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
