# Security Group Module Example

This module is used to create a Security Group

This example illustrates how to use the [security-group](./../modules/security-group) module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the Security Group | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.