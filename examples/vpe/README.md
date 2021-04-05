# Virtual Private Endpoint Module Example

This module is used to create a Virtual Endpoint Gateway and IPs

This example illustrates how to use the `vpe` module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| create\_endpoint\_gateway | True to create new endpoint gateway. False if endpoint gateway is already existing and endpoint gateway ips are to be added | bool | n/a | yes |
| name | Name of the new Endpoint Gateway. Required if creating a new Gateway | string | n/a | no |
| vpc | VPC Name of the new Endpoint Gateway. Required if creating a new Endpoint Gateway | string | n/a | no |
| resource\_group | Resource group Name| string | n/a | no |
| target | Gateway target | list(object) | n/a | no |
| ips | Gateway IPs | list(object) | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |
| endpoint\_gateway | Existing Enpoint Gateway's ID to which Reserved IPs are to be attached | string | n/a | no |
| reserved\_ips | List of New reserved IPs to the Endpoint Gateway | list(object) | n/a | no |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of target, ips, reserved_ips, tags to be attached to the Gateway resources by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.