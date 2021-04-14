# VPC Image Module Example

This example illustrates how to use the `image` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Resource group Name | string | n/a | no |
| name | Name of the Image | string | n/a | yes |
| href | Image Href value | string | n/a | yes |
| operating\_system | Image Operating system  | string | n/a | yes |
| encrypted\_data\_key | A base64-encoded, encrypted representation of the key that was used to encrypt the data for this image  | string | n/a | no |
| encryption\_key | The CRN of the Key Protect Root Key or Hyper Protect Crypto Service Root Key for this resource | string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to the image by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.