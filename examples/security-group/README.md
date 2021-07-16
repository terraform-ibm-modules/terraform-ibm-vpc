# Security Group Module Example

This module is used to create a Security Group

This example illustrates how to use the `security-group` module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| create\_security\_group | True to create new security group. False if security group is already existing and security group rules are to be added | bool | bool | n/a | yes |
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the new Security Group. Required if creating a new sg | string | n/a | no |
| vpc | VPC Name of the new Security Group. Required if creating a new sg | string | n/a | no |
| security\_group | Existing Security Group's name to which rules are to be attached | string | n/a | no |
| security\_group\_rules | Security Group rules | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | The ID of the Security Group |
| security\_group\_rules | All the Security Group Rule IDs|

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of security group rules to be attached to the security group by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.