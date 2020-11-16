# Instance Module Example

This module is used to create an Instance

## Example Usage
```
data "ibm_is_vpc" "testacc_vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "instance" {
  source = "../../modules/instance"

  name                      = var.name
  vpc_id                    = data.ibm_is_vpc.testacc_vpc.id
  resource_group_id         = data.ibm_resource_group.resource_group.id
  location                  = var.location
  image                     = var.image
  profile                   = var.profile
  ssh_keys                  = var.ssh_keys
  primary_network_interface = var.primary_network_interface
  user_data                 = (var.user_data != null ? var.user_data : null)
  boot_volume               = (var.boot_volume != null ? var.boot_volume : null)
  network_interfaces        = (var.network_interfaces != null ? var.network_interfaces : null)
  data_volumes              = (var.data_volumes != null ? var.data_volumes : [])
  tags                      = (var.tags != null ? var.tags : [])
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Subnet | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the subnet  | string | n/a | yes |
| image | Image ID for the instance  | string | n/a | yes |
| profile | Profile type for the Instance  | string | n/a | yes |
| ssh\_keys | List of ssh key IDs to the instance  | list(string) | n/a | yes |
| primary\_network\_interface | List of primary_network_interface that are to be attached to the instance  | object | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| user\_data | User Data for the instance  | string | n/a | no |
| boot\_volume | List of boot volume that are to be attached to the instance| object | n/a | no |
| network\_interfaces | List of network_interfaces that are to be attached to the instance  | object | n/a | no |
| data\_volumes | List of volume ids that are to be attached to the instance  | list(string) | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | The ID of the Instance |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->