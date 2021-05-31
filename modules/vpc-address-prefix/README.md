# Module VPC Address Prefix

This module is used to create a VPC Address Prefix

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

module "vpc-address-prefix" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpc-address-prefix"

  name     = var.name
  vpc_id   = data.ibm_is_vpc.vpc.id
  location = var.location
  ip_range = var.ip_range
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Address Prefix | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the Address Prefix  | string | n/a | yes |
| ip\_range | CIDR block of the Address Prefix | string | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| vpc\_address\_prefix\_id | The ID of the Address Prefix |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
