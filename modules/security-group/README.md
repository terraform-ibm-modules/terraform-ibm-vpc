# Security Group Module Example

This module is used to create a Security Group

## Example Usage
```
data "ibm_is_vpc" "testacc_vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "security_group" {
  source = "../../modules/security-group"

  name                       = var.name
  vpc_id                     = data.ibm_is_vpc.testacc_vpc.id
  resource_group_id          = data.ibm_resource_group.resource_group.id
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Security Group | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| resource\_group | Name of the resource group | string | default | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | The ID of the Security Group |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->