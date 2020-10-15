# Module VPC Route

This module is used to create a VPC Route

## Example Usage
```
module "vpc-route" {
  source = "../../modules/configure-vpc/vpc-route"

  name             = var.name
  vpc_id           = data.ibm_is_vpc.testacc_vpc.id
  location         = var.location
  destination_cidr = var.destination_cidr
  next_hop         = var.next_hop
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the VPC Route | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the Route  | string | n/a | yes |
| destination_cidr | Destination CIDR block of the route| string | n/a | yes |
| next_hop | The IP address where network traffic is sent next | string | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| vpc\_route\_id | The ID of the VPC Route |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
