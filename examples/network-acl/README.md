# Network ACL Module Example

This module is used to create a Network ACL

This example illustrates how to use the [network_acl](./../modules/network-acl) module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the Network ACL | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| rules | List of Network ACL Rules that are to be attached to the ACL  | object | n/a | no |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.