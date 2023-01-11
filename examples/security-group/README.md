# Security Group Module Example

This module is used to create a Security Group

This example illustrates how to use the `security-group` module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | ../../modules/security-group | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/is_vpc) | data source |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | True to create new security group. False if security group is already existing and security group rules are to be added | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the new Security Group | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_security_group"></a> [security\_group](#input\_security\_group) | Existing Security Group's name to which rules are to be attached. | `string` | `null` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | Security Group rules | `list` | `[]` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC Name of the new security group | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the Security group |
| <a name="output_security_group_rules"></a> [security\_group\_rules](#output\_security\_group\_rules) | All the IDs of Security group Rules |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of security group rules to be attached to the security group by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.