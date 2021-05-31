# Virtual Endpoint Gateway Module Example

This module is used to create Virtual Endpoint Gateway and IPs

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  count = var.create_endpoint_gateway ? 1 : 0
  name  = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "vpe" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpe"

  create_endpoint_gateway = var.create_endpoint_gateway
  name                    = var.name
  vpc_id                  = var.create_endpoint_gateway ? data.ibm_is_vpc.vpc[0].id : null
  resource_group_id       = data.ibm_resource_group.resource_group.id
  target                  = var.target
  ips                     = var.ips
  tags                    = var.tags
  endpoint_gateway        = var.endpoint_gateway
  reserved_ips            = var.reserved_ips
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| create\_endpoint\_gateway | True to create new endpoint gateway. False if endpoint gateway is already existing and endpoint gateway ips are to be added | bool | n/a | yes |
| name | Name of the new Endpoint Gateway. Required if creating a new Gateway | string | n/a | no |
| vpc\_id | VPC ID of the new Endpoint Gateway. Required if creating a new Endpoint Gateway | string | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| target | Gateway target | list(object) | n/a | no |
| ips | Gateway IPs | list(object) | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |
| endpoint\_gateway | Existing Enpoint Gateway's ID to which Reserved IPs are to be attached | string | n/a | no |
| reserved\_ips | List of New reserved IPs to the Endpoint Gateway | list(object) | n/a | no |


## Outputs

| Name | Description |
|------|-------------|
| endpoint\_gateway\_id | The ID of the endpoint gateway |
| gateway\_reserved\_ips | All the Gateway Reserved IPs |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->