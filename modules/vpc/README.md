# Module VPC

This module is used to create a VPC

## Example Usage

```terraform

data ibm_resource_group resource_group {
  name = var.resource_group != null ? var.resource_group : "default"
}

module vpc {
  source                              = "terraform-ibm-modules/vpc/ibm//modules/vpc"
  create_vpc                          = var.create_vpc
  region                              = var.region
  vpc_name                            = var.vpc_name
  prefix                              = var.prefix
  resource_group_id                   = var.resource_group_id
  classic_access                      = var.classic_access
  auto_prefix_management              = var.auto_prefix_management
  default_network_acl_name            = var.default_network_acl_name
  default_security_group_name         = var.default_security_group_name
  default_routing_table_name          = var.default_routing_table_name
  tags                                = var.tags
  address_prefixes                    = var.address_prefixes
  create_subnets_for_address_prefixes = var.create_subnets_for_address_prefixes
  acl_id                              = var.acl_id
  create_public_gateway               = var.create_public_gateway
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Variables

Name                                | Type                                                                          | Description                                                                                                                                                   | Sensitive | Default                                 | Required
----------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | --------------------------------------- | --------
create_vpc                          | bool                                                                          | True to create new VPC. False if VPC is already existing and subnets or address prefixies are to be added                                                     |           | true                                    |  
region                              | string                                                                        | Region where VPC will be created                                                                                                                              |           | us-south                                | true
vpc_name                            | string                                                                        | Name of the VPC                                                                                                                                               |           |                                         | true
prefix                              | string                                                                        | A prefix to be added to the beginning of resources created that are not the VPC                                                                               |           | default                                 | 
resource_group_id                   | string                                                                        | ID of resource group.                                                                                                                                         |           | null                                    | 
classic_access                      | bool                                                                          | Classic Access to the VPC. This cannot be added after the VPC is created.                                                                                     |           | false                                   | 
auto_prefix_management              | bool                                                                          | Indicates whether a default address prefix should be created automatically. If false, address prefixes will be managed manually.                              |           | true                                    | 
default_network_acl_name            | string                                                                        | Name of the Default ACL                                                                                                                                       |           | null                                    | 
default_security_group_name         | string                                                                        | Name of the Default Security Group                                                                                                                            |           | null                                    | 
default_routing_table_name          | string                                                                        | Name of the Default Routing Table                                                                                                                             |           | null                                    | 
tags                                | list(string)                                                                  | List of Tags for the vpc                                                                                                                                      |           | []                                      | 
address_prefixes                    | object({ zone-1 = list(string) zone-2 = list(string) zone-3 = list(string) }) | List of Prefixes for the vpc                                                                                                                                  |           | { zone-1 = [], zone-2 = [], zone-3 = [] | 
create_subnets_for_address_prefixes | bool                                                                          | Create a subnet for each of the address prefixes                                                                                                              |           | false                                   | 
acl_id                              | string                                                                        | Use the ID of an ACL for creation of subnets. Leave empty to use the default vpc acl                                                                          |           | ""                                      | 
create_public_gateway               | bool                                                                          | If true a public gateway will be created in each zone where an address prefix will be created. If true, all subnets created will be attached to this gateway. |           | false                                   |

## Outputs

Name                      | Description
------------------------- | -----------------------------------------------------------
id                        | The ID of the vpc
default_security_group_id | The ID of the vpc default security group
default_acl_id            | The ID of the vpc default network acl
default_routing_table_id  | The ID of the vpc default Routing Table
address_prefixes          | The Address Prefixes of the VPC
address_prefixes_cidr     | The Address Prefix CIDRs of the VPC
subnet_ids                | The IDs of the subnets
subnet_detail_list        | A list of subnets containing names, CIDR blocks, and zones.
subnet_zone_list          | A list containing cluster subnet IDs and subnet zones
public_gateway_ids        | The IDs of the Public Gateways
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->