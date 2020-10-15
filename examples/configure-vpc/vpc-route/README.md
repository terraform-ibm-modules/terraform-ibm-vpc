# VPC Route Module Example

This example illustrates how to use the [vpc-route](../../../modules/configure-vpc/vpc-route) module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the VPC Route | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the Route  | string | n/a | yes |
| destination_cidr | Destination CIDR block of the route| string | n/a | yes |
| next_hop | The IP address where network traffic is sent next | string | n/a | yes |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
