# Module VPC

This module is used to create a VPC

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "vpc" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpc"

  name                      = var.name
  resource_group_id         = data.ibm_resource_group.resource_group.id
  classic_access            = (var.classic_access != null ? var.classic_access : false)
  default_address_prefix    = (var.default_address_prefix != null ? var.default_address_prefix : "auto")
  tags                      = (var.tags != null ? var.tags : [])
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| vpc\_name | Name of the vpc | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| classic\_access | Indicates whether this VPC should be connected to Classic Infrastructure. | bool | false | no |
| default\_prefix\_management | Indicates whether a default address prefix should be automatically created for each zone in this VPC.  | string | auto | no |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC |
| vpc\_default\_security\_group |The ID of the vpc default security group |
| vpc\_default\_network\_acl | The ID of the vpc default network acl |
| vpc\_default\_routing\_table | The ID of the vpc default Routing Table |
