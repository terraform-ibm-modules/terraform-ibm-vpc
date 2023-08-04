# Instance Module Example

This example illustrates how to use the `instance` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name                      | Description                                                                     | Type                                                                                                                   | Default | Required
------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ------- |------
instance_name             | Name of the Instance                                                            | string                                                                                                                 |         | true
vpc_name                  | VPC name                                                                        | string                                                                                                                 |         | true
subnet_name               | Subnet in VPC where instances will be created                                   | string                                                                                                                 |         | true
image_name                | Name of the image for the VSI                                                   | string                                                                                                                 |         | true
profile                   | Profile type for the Instance                                                   | string                                                                                                                 |         | true
ssh_key_name              | Name of SSH key to use when provisioning VSI                                    | string                                                                                                                 |         | true
security_group_ids        | Optional. A list of security group ids to attach the primary network interface. | list(string)                                                                                                           | []      |
primary_network_interface | List of primary_network_interface that are to be attached to the instance       | list(object({ interface_name = string primary_ipv4_address = string }))                                                | {  interface_name       = ""  primary_ipv4_address = "" } |
resource_group            | Resource group name                                                             | string                                                                                                                 | null    |
instances                 | number of Instances                                                             | number                                                                                                                 | 1       |
user_data                 | User Data for the instance                                                      | string                                                                                                                 | null    |
data_volumes              | List of volume ids that are to be attached to the instance                      | list(string)                                                                                                           | null    |
tags                      | List of Tags for the vpc                                                        | list(string)                                                                                                           | null    |
network_interfaces        | List of network_interfaces that are to be attached to the instance              | list(object({ subnet = string interface_name = string security_groups = list(string) primary_ipv4_address = string })) | null    |
boot_volume               | List of boot volume that are to be attached to the instance                     | list(object({ name = string encryption = string }))                                                                    | null    |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of primary_network_interface, network_interfaces, boot_volume, tags, ssh_keys, data_volumes to be attached to the instance by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.