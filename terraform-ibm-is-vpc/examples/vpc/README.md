# Module VPC

This module is used to create a VPC

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

module "vpc" {
  source = "../../modules/vpc"

  name                      = var.name
  resource_group_id         = data.ibm_resource_group.resource_group.id
  classic_access            = (var.classic_access != null ? var.classic_access : false)
  default_address_prefix    = (var.default_address_prefix != null ? var.default_address_prefix : "auto")
  tags                      = (var.tags != null ? var.tags : [])
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the vpc | string | n/a | yes |
| resource\_group | ID of the resource group | string | n/a | no |
| classic\_access | Indicates whether this VPC should be connected to Classic Infrastructure. | Boolean | false | no |
| default\_prefix\_management | Indicates whether a default address prefix should be automatically created for each zone in this VPC.  | string | auto | no |
| tags | List of tags to attach  | List | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a VPC by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

All optional fields are given value `null` in varaible.tf file. User can configure the same by overwriting with appropriate values.

