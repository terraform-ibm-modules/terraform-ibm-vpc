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

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Volume | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| location | Volume Zone | string | n/a | yes |
| volume\_profile | The profile to use for this volume | string | n/a | yes |
| iops | The total i/o operations per sec for the storage. This value is required for `custom` type volume_profile only | number | n/a | no |
| size | The capacity of the volume in gigabytes | number | n/a | no |
| encryption | The encryption key to use for encrypting this volume | string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| volume\_id | The ID of the Volume |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->