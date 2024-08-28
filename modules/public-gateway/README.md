# Public Gateway Example

This module is used to create a Public Gateway

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "public_gateway" {
  source = "terraform-ibm-modules/vpc/ibm//modules/public-gateway"

  name              = var.name
  vpc_id            = data.ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.location
  floating_ip       = var.floating_ip
  tags              = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Public Gateway | string | n/a | yes |
| vpc\_id | VPC ID | string | n/a | yes |
| location | Zone of the Public Gateway  | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| floating\_ip | Floating IP `id` or `address` that you want to assign to the public gateway | map | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| public\_gateway\_id | The ID of the Public Gateway |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
