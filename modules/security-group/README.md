# Security Group Module Example

This module is used to create a Security Group

## Example Usage
```
data "ibm_is_vpc" "testacc_vpc" {
  count = var.create_security_group ? 1 : 0
  name  = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  rules = [
    for r in var.security_group_rules : {
      name       = r.name
      direction  = r.direction
      remote     = lookup(r, "remote", null)
      ip_version = lookup(r, "ip_version", null)
      icmp       = lookup(r, "icmp", null)
      tcp        = lookup(r, "tcp", null)
      udp        = lookup(r, "udp", null)
    }
  ]
}

module "security_group" {
  source = "terraform-ibm-modules/vpc/ibm//modules/security-group"

  create_security_group = var.create_security_group
  name                  = var.name
  vpc_id                = var.create_security_group ? data.ibm_is_vpc.testacc_vpc[0].id : null
  resource_group_id     = data.ibm_resource_group.resource_group.id
  security_group        = var.security_group
  security_group_rules  = local.rules
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| create\_security\_group | True to create new security group. False if security group is already existing and security group rules are to be added | bool | n/a | yes |
| name | Name of the new Security Group. Required if creating a new sg | string | n/a | no |
| vpc\_id | VPC ID of the new security group. Required if creating a new sg | string | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| security\_group | Existing Security Group's ID to which rules are to be attached | string | n/a | no |
| security\_group\_rules | Security Group rules | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | The ID of the Security Group |
| security\_group\_rules | All the Security Group Rules|


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->