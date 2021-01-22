# VPC Block Storage Module Example

This example illustrates how to use the `volume` module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the Volume | string | n/a | yes |
| location | Volume Zone | string | n/a | yes |
| volume\_profile | The profile to use for this volume | string | n/a | yes |
| iops | The total i/o operations per sec for the storage. This value is required for `custom` type volume_profile only | number | n/a | no |
| size | The capacity of the volume in gigabytes | number | n/a | no |
| encryption | The encryption key to use for encrypting this volume | string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


NOTE: We can configure the list of tags to be attached to a the Volume by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.