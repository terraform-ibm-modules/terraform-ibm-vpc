# Image Module

Provide an image resource. This allows images to be created, retrieved, and deleted. For more information, about VPC custom images, see IBM Cloud Docs: Virtual Private Cloud - IBM Cloud Importing and managing custom images.

## Example Usage

``` terraform
provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "image" {
  # source = "terraform-ibm-modules/vpc/ibm//modules/image"
  source = "../../modules/image"

  name               = "im"
  resource_group_id  = data.ibm_resource_group.resource_group.id
  href               = "cos://us-south/buckettesttest/livecd.ubuntu-cpc.azure.vhd"
  operating_system   = "ubuntu-16-04-amd64"
  encrypted_data_key = "eJxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0="
  encryption_key     = "crn:v1:bluemix:public:kms:us-south:a"
  tags               = ["T1","T2"]
}
```
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
| [ibm_is_image.image](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_image) | resource |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Image | `string` | n/a | yes |
| <a name="input_href"></a> [href](#input\_href) | Image Href value | `string` | n/a | yes |
| <a name="input_operating_system"></a> [operating\_system](#input\_operating\_system) | Image Operating system | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_encrypted_data_key"></a> [encrypted\_data\_key](#input\_encrypted\_data\_key) | A base64-encoded, encrypted representation of the key that was used to encrypt the data for this image | `string` | `null` | no |
| <a name="input_encryption_key"></a> [encryption\_key](#input\_encryption\_key) | The CRN of the Key Protect Root Key or Hyper Protect Crypto Service Root Key for this resource | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Floating IP | `list(string)` | `null` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_id"></a> [image\_id](#output\_image\_id) | Image ID |
