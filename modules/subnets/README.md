# SUBNET Module Example

This module is used to create subnets and get data for existing subnets

## Example Usage
```
data ibm_is_vpc vpc {
  name = var.vpc
}

data ibm_resource_group resource_group {
  name = var.resource_group != null ? var.resource_group : "default"
}

module subnet {
  source                 = "terraform-ibm-modules/vpc/ibm//modules/subnet"
  prefix                 = var.prefix
  vpc_id                 = var.vpc_id
  region                 = var.region
  subnets                = var.subnets
  create_subnet_prefixes = var.create_subnet_prefixes
  resource_group_id      = var.resource_group_id
  public_gateways        = var.public_gateways
  routing_table_id       = var.routing_table_id
  acl_id                 = var.acl_id
  subnet_names           = var.subnet_names
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name                   | Description                                                                                                                                                                                  | Type                                                                          | Default
---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------
prefix                 | Prefix to be added to the beginning of each subnet name                                                                                                                                      | string                                                                        | 
vpc_id                 | ID of VPC where subnets will be created                                                                                                                                                      | string                                                                        | 
region                 | Region where VPC will be created                                                                                                                                                             | string                                                                        | us-south
subnets                | List of subnets for the vpc. For each item in each array, a subnet will be created. Items can be either CIDR blocks or total ipv4 addressess                                                 | object({ zone-1 = list(string) zone-2 = list(string) zone-3 = list(string) }) | { zone-1 = ["10.90.10.0/24", "10.110.10.0/24"], zone-2 = [256], zone-3 = ["10.70.10.0/24", 256] }
create_subnet_prefixes | Create prefixes on the VPC for subnets                                                                                                                                                       | bool                                                                          | true
resource_group_id      | Optional. Resource group ID                                                                                                                                                                  | string                                                                        | null
public_gateways        | Optional. A map of public gateway IDs. To not use a gateway in a specific zone, leave string empty. If public gateway IDs are provided, they will be used by any subnet created in the zone. | object({ zone-1 = string zone-2 = string zone-3 = string })                   | { zone-1 = "" zone-2 = "" zone-3 = "" }
routing_table_id       | Optional. Routing Table ID                                                                                                                                                                   | string                                                                        | null
acl_id                 | Optional. ACL ID to use for subnet creation                                                                                                                                                  | string                                                                        | null }
subnet_names           | Optional. A list of subnet names to get from data blocks                                                                                                                                     | list(string)                                                                  | []

## Outputs

Name                  | Description
--------------------- | -----------------------------------------------------------
ids                   | The IDs of the subnets
detail_list           | A list of subnets containing names, CIDR blocks, and zones.
zone_list             | A list containing subnet IDs and subnet zones
address_prefixes      | The Address Prefixes added to the VPC
address_prefixes_cidr | The Address Prefix CIDRs of the VPC

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->