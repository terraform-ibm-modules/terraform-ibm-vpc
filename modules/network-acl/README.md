# Network ACL Module Example

This module is used to create a Network ACL

## Example Usage
```
data "ibm_is_vpc" "testacc_vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  rules = [
    for r in var.rules : {
      name        = r.name
      action      = r.action
      source      = r.source
      destination = r.destination
      direction   = r.direction
      icmp        = lookup(r, "icmp", null)
      tcp         = lookup(r, "tcp", null)
      udp         = lookup(r, "udp", null)
    }
  ]
}

module "network_acl" {
  source = "terraform-ibm-modules/vpc/ibm//modules/network-acl"

  name              = var.name
  vpc_id            = data.ibm_is_vpc.testacc_vpc.id
  resource_group_id = data.ibm_resource_group.resource_group.id
  rules             = local.rules
  tags              = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Network ACL | string | n/a | yes |
| vpc\_id | Name of the VPC | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| rules | List of Network ACL Rules that are to be attached to the ACL  | list(object) | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| network\_acl_\_id | The ID of the Network ACL |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->