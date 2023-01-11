# Instance Module Example

Create, update, or delete a Virtual Servers for VPC instance. For more information, about managing VPC instance, see about virtual server instances for VPC.

## Example Usage

``` terraform
provider "ibm" {
}

data "ibm_is_vpc" "vpc" {
  name = "myvpc"
}

data "ibm_resource_group" "resource_group" {
  name = "default"
}

module "instance" {
  // source = "terraform-ibm-modules/vpc/ibm//modules/instance"
  source = "../../modules/instance"

  no_of_instances           = 1
  name                      = "myinstance"
  vpc_id                    = data.ibm_is_vpc.vpc.id
  resource_group_id         = data.ibm_resource_group.resource_group.id
  location                  = "us-south"
  image                     = "jskd-98274-hsjdj"
  profile                   = "bc1-2x8"
  ssh_keys                  = ["k1_id","k2-id"]
  primary_network_interface = var.primary_network_interface
  user_data                 = var.user_data
  boot_volume               = var.boot_volume
  network_interfaces        = var.network_interfaces
  data_volumes              = var.data_volumes
  tags                      = var.tags
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_group) | data source |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_vpc) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instance"></a> [instance](#module\_instance) | ./../../modules/instance | n/a |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the instance | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The zone where the instance was created. | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | ID of the Image | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | Profile type for the Instance | `string` | n/a | yes |
| <a name="input_ssh_keys"></a> [ssh_keys](#input\_ssh\_keys) | List of ssh key IDs to the instance | `string` | n/a | yes |
| <a name="input_primary_network_interface"></a> [primary_network_interface](#input\_primary\_network\_interface) | List of primary_network_interface that are to be attached to the instance | `list(string)` | n/a | yes |

| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_no_of_instances"></a> [no\_of\_instances](#input\_no\_of\_instances) | Number of VSI instances to create | `number` | 1 | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data for the instance | `string` | `null` | no |
| <a name="input_data_volumes"></a> [data\_volumes](#input\_data\_volumes) | List of volume ids that are to be attached to the instance | `list(string)` | `null` | no |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | List of network_interfaces that are to be attached to the instance | `list(object)` | `null` | no |
| <a name="input_boot_volume"></a> [boot\_volume](#input\_boot\_volume) | List of boot volume that are to be attached to the instance | `list(object)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Floating IP | `list(string)` | `null` | no |


## Outputs

No outputs

## Usage

```
terraform init
```
```
terraform plan
```
```
terraform apply
```
