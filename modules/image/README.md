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

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Image | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| href | Image Href value | string | n/a | yes |
| operating\_system | Image Operating system  | string | n/a | yes |
| encrypted\_data\_key | A base64-encoded, encrypted representation of the key that was used to encrypt the data for this image  | string | n/a | no |
| encryption\_key | The CRN of the Key Protect Root Key or Hyper Protect Crypto Service Root Key for this resource | string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| image\_id | The ID of the Image |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
