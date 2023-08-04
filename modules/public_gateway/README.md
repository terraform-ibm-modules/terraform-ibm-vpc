# Public Gateway Example

This module is used to create Public Gateways in a single vpc

## Example Usage
```
data ibm_is_vpc vpc {
  name = var.vpc
}

data ibm_resource_group resource_group {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module public_gateway {
  source               = "terraform-ibm-modules/vpc/ibm//modules/public-gateway"
  vpc_id               = var.vpc_id
  zones                = var.zones
  prefix               = var.prefix
  resource_group_id    = var.resource_group_id
  floating_ip          = var.floating_ip
  tags                 = var.tags
  public_gateway_names = var.public_gateway_names
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name                 | Description                                                                                                                   | Type                                                        | Default
-------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- | ---------------------------------------
vpc_id               | VPC ID                                                                                                                        | string                                                      | 
zones                | A list of zones to create public gateways. These zones must be in the VPC region                                              | list(string)                                                | ["us-south-1"]
prefix               | Prefix to add to the beginning of created Public Gateways                                                                     | string                                                      | pgw
resource_group_id    | Resource group ID                                                                                                             | string                                                      | null
floating_ip          | Optional. Floating IP `id`'s or `address`'es that you want to assign to the public gateway. Leave as empty string to disable. | object({ zone-1 = string zone-2 = string zone-3 = string }) | { zone-1 = "" zone-2 = "" zone-3 = "" }
tags                 | Optional. List of Tags for the Public Gateway                                                                                 | list(string)                                                | []
public_gateway_names | Optional. A list of public gateways to get by name                                                                            | list(string)                                                | []

## Outputs

Name              | Description
----------------- | -------------------------------
ids               | The ID of the Public Gateways
ids_by_zone       | A list of IDs by zone
addresses         | List of public gatway addresses
addresses_by_zone | A list of addresses by zone

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->