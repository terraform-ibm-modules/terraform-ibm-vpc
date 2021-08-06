# Subnet Module Example

This example illustrates how to use the `subnet` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name                   | Description                                                                                                                                                                                  | Type                                                                          | Default
---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------
vpc                    | VPC name                                                                                                                                                                                     | string                                                                        | 
region                 | Region where VPC will be created                                                                                                                                                             | string                                                                        | us-south
prefix                 | Prefix to be added to the beginning of each subnet name                                                                                                                                      | string                                                                        | 
subnets                | List of subnets for the vpc. For each item in each array, a subnet will be created. Items can be either CIDR blocks or total ipv4 addressess                                                 | object({ zone-1 = list(string) zone-2 = list(string) zone-3 = list(string) }) | { zone-1 = ["10.90.10.0/24", "10.110.10.0/24"], zone-2 = [256], zone-3 = ["10.70.10.0/24", 256] }
create_subnet_prefixes | Create prefixes on the VPC for subnets                                                                                                                                                       | bool                                                                          | true
public_gateways        | Optional. A map of public gateway IDs. To not use a gateway in a specific zone, leave string empty. If public gateway IDs are provided, they will be used by any subnet created in the zone. | object({ zone-1 = string zone-2 = string zone-3 = string })                   | { zone-1 = "" zone-2 = "" zone-3 = "" }
routing_table_id       | Optional. Routing Table ID                                                                                                                                                                   | string                                                                        | null
acl_id                 | Optional. ACL ID to use for subnet creation                                                                                                                                                  | string                                                                        | null }
subnet_names           | Optional. A list of subnet names to get from data blocks                                                                                                                                     | list(string)                                                                  | []

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
