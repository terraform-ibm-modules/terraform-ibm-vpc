# SUBNET Module Example

This example illustrates how to use the `subnet` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the Subnet | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the subnet  | string | n/a | yes |
| ip\_range | IP range/CIDR block of the Subnet. Either `ip_range` or `number_of_addresses` input parameters must be provided in the module| number | n/a | no |
| number\_of\_addresses | The total number of IPv4 addresses. Either `ip_range` or `number_of_addresses` input parameters must be provided in the module | number | n/a | no |
| subnet\_access\_control\_list | Network ACL ID  | string | n/a | no |
| public\_gateway | Public Gateway ID  | string | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.

