# Public Gateway Module Example

This example illustrates how to use the `public_gateway` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name                 | Type                                                        | Description                                                                                                                   | Default
-------------------- | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------
vpc                  | string                                                      | VPC name                                                                                                                      | 
resource_group       | string                                                      | Resource group name                                                                                                           | null
zones                | list(string)                                                | A list of zones to create public gateways. These zones must be in the VPC region                                              | ["us-south-1"]
prefix               | string                                                      | Prefix to add to the beginning of created Public Gateways                                                                     | pgw
floating_ip          | object({ zone-1 = string zone-2 = string zone-3 = string }) | Optional. Floating IP `id`'s or `address`'es that you want to assign to the public gateway. Leave as empty string to disable. | { zone-1 = "" zone-2 = "" zone-3 = "" }
tags                 | list(string)                                                | Optional. List of Tags for the Public Gateway                                                                                 | []
public_gateway_names | list(string)                                                | Optional. A list of public gateways to get by name                                                                            | []
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


NOTE: We can configure the list of tags, floating_ip to be attached to a the Public Gateway by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.