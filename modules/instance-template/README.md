# Instance Template Module Example

This module is used to create an Instance Template

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "instance" {
  source = "terraform-ibm-modules/vpc/ibm//modules/instance-template"

  name                      = var.name
  vpc_id                    = data.ibm_is_vpc.vpc.id
  resource_group_id         = data.ibm_resource_group.resource_group.id
  location                  = var.location
  image                     = var.image
  profile                   = var.profile
  ssh_keys                  = var.ssh_keys
  primary_network_interface = var.primary_network_interface
  user_data                 = var.user_data
  boot_volume               = var.boot_volume
  network_interfaces        = var.network_interfaces
  volume_attachments        = var.volume_attachments
  dedicated_host            = var.dedicated_host
  dedicated_host_group      = var.dedicated_host_group
  tags                      = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Instance Template | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the subnet  | string | n/a | yes |
| image | Image ID for the Instance Template  | string | n/a | yes |
| profile | Profile type for the Instance Template | string | n/a | yes |
| ssh\_keys | List of ssh key IDs to the Instance Template  | list(string) | n/a | yes |
| primary\_network\_interface | List of primary_network_interface that are to be attached to the Instance Template  | list(object) | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| user\_data | User Data for the Instance Template  | string | n/a | no |
| boot\_volume | List of boot volume that are to be attached to the Instance Template| list(object) | n/a | no |
| network\_interfaces | List of network_interfaces that are to be attached to the Instance Template  | list(object) | n/a | no |
| volume\_attachments | List of volume Attachments that are to be attached to the instance Template  | list(object) | n/a | no |
| dedicated\_host | Unique Identifier of the Dedicated Host where the instance will be placed | string | n/a | no |
| dedicated\_host\_group | Unique Identifier of the Dedicated Host Group where the instance will be placed  | string | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| Instance\_template_\_id | The ID of the Instance Template |
| primary\_network\_interfaces | The primary_network_interface IDs of the Instance Template |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->