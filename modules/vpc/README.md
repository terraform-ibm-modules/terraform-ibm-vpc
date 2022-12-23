# Module VPC

This module is used to create a VPC

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "vpc" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpc"

  create_vpc                  = var.create_vpc
  vpc_name                    = var.vpc_name
  resource_group_id           = data.ibm_resource_group.resource_group.id
  classic_access              = var.classic_access
  default_address_prefix      = var.default_address_prefix
  default_network_acl_name    = var.default_network_acl_name
  default_security_group_name = var.default_security_group_name
  default_routing_table_name  = var.default_routing_table_name
  vpc_tags                    = var.vpc_tags
  address_prefixes            = var.address_prefixes
  locations                   = var.locations
  subnet_name                 = var.subnet_name
  number_of_addresses         = var.number_of_addresses
  vpc                         = var.vpc
  create_gateway              = var.create_gateway
  public_gateway_name         = var.public_gateway_name
  floating_ip                 = var.floating_ip
  gateway_tags                = var.gateway_tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| create\_vpc | True to create new VPC. False if VPC is already existing and subnets, gateways are to be added to it | bool | n/a | yes |
| vpc\_name | Name of the vpc. Required only if Creating a new VPC | string | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| classic\_access | Indicates whether this VPC should be connected to Classic Infrastructure. | bool | false | no |
| default\_address\_prefix | Indicates whether a default address prefix should be automatically created for each zone in this VPC.  | string | auto | no |
| default\_network\_acl\_name | Name of the Default ACL of the VPC | string | n/a | no |
| default\_security\_group\_name | Name of the Default Security Group of the VPC | string | n/a | no |
| default\_routing\_table\_name | Name of the Default Routing Table of the VPC  | string | n/a | no |
| vpc\_tags | List of tags to attach to the VPC | list(string) | n/a | no |
| address\_prefixes | List of Prefixes for the vpc | list(object) | n/a | no |
| locations | zones per region | list(string) | n/a | no |
| subnet\_name\_prefix | Name(or Prefix) of the Subnet(s). Required only while Creating a new subnet(s) | string | n/a | no |
| number\_of\_addresses | Number of IPV4 Addresses. Required only while Creating a new subnet(s) | number | n/a | no |
| vpc | Name of the Existing VPC to which subnets, gateways are to be attached | string | n/a | no |
| create\_gateway | True to create new Public Gateway | bool | false | no |
| public\_gateway\_name\_prefix | Name(or prefix) of the Public Gateway(s). Required only if Creating a new Public Gateway | string | n/a | no |
| floating\_ip | Floating IP `id` or `address` that you want to assign to the public gateway | map | n/a | no |
| gateway\_tags | List of Tags for the gateway | list(string) | n/a | no |


## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC |
| vpc\_default\_security\_group |The ID of the vpc default security group |
| vpc\_default\_network\_acl | The ID of the vpc default network acl |
| vpc\_default\_routing\_table | The ID of the vpc default Routing Table |
| vpc\_address\_prefixes | The ID(s) of the Address Prefixes to VPC |
| subnet\_ids | The ID(s) of the Subnet(s) |
| public\_gateway\_ids | The ID(s) of the Public Gateway(s) |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->