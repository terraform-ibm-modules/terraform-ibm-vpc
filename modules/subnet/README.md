# SUBNET Module Example

This module is used to create a Subnet

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "subnet" {
  source = "terraform-ibm-modules/vpc/ibm//modules/subnet"

  name                       = var.name
  vpc_id                     = data.ibm_is_vpc.vpc.id
  resource_group_id          = data.ibm_resource_group.resource_group.id
  location                   = var.location
  ip_range                   = var.ip_range
  number_of_addresses        = var.number_of_addresses
  subnet_access_control_list = var.subnet_access_control_list
  public_gateway             = var.public_gateway
  routing_table              = var.routing_table
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Subnet | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the subnet  | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| ip\_range | IP range/CIDR block of the Subnet. Either `ip_range` or `number_of_addresses` input parameters must be provided in the module| string | n/a | no |
| number\_of\_addresses | The total number of IPv4 addresses. Either `ip_range` or `number_of_addresses` input parameters must be provided in the module | number | n/a | no |
| subnet\_access\_control\_list | Network ACL ID  | string | n/a | no |
| public\_gateway | Public Gateway ID  | string | n/a | no |
| routing\_table | Routing Table ID  | string | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_id | The ID of the Subnet |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->