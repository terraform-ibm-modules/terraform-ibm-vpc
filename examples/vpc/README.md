# Module VPC

This example illustrates how to use the `vpc` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name                                | Description                                                                                                                                                   | Type                                                                          | Default
----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ---------------------------------------
create_vpc                          | True to create new VPC. False if VPC is already existing and subnets or address prefixies are to be added                                                     | bool                                                                          | true
resource_group                      | Name of resource group. If null will use the `default` resource group                                                                                         | string                                                                        | null
region                              | Region where VPC will be created                                                                                                                              | string                                                                        | us-south
vpc_name                            | Name of the VPC                                                                                                                                               | string                                                                        | 
prefix                              | A prefix to be added to the beginning of resources created that are not the VPC                                                                               | string                                                                        | default
classic_access                      | Classic Access to the VPC. This cannot be added after the VPC is created.                                                                                     | bool                                                                          | false
auto_prefix_management              | Indicates whether a default address prefix should be created automatically. If false, address prefixes will be managed manually.                              | string                                                                        | true
default_network_acl_name            | Name of the Default ACL                                                                                                                                       | string                                                                        | null
default_security_group_name         | Name of the Default Security Group                                                                                                                            | string                                                                        | null
default_routing_table_name          | Name of the Default Routing Table                                                                                                                             | string                                                                        | null
tags                                | List of Tags for the vpc                                                                                                                                      | list(string)                                                                  | []
address_prefixes                    | List of Prefixes for the vpc                                                                                                                                  | object({ zone-1 = list(string) zone-2 = list(string) zone-3 = list(string) }) | { zone-1 = [], zone-2 = [], zone-3 = []
create_subnets_for_address_prefixes | Create a subnet for each of the address prefixes                                                                                                              | bool                                                                          | false
acl_id                              | Use the ID of an ACL for creation of subnets. Leave empty to use the default vpc acl                                                                          | string                                                                        | 
create_public_gateway               | If true a public gateway will be created in each zone where an address prefix will be created. If true, all subnets created will be attached to this gateway. | bool                                                                          | false


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
subnet_zone_list          | A list containing subnet IDs and subnet zones
public_gateway_ids        | The IDs of the Public Gateways

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a VPC by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
