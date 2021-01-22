# Instance Module Example

This example illustrates how to use the `instance` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the Subnet | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the subnet  | string | n/a | yes |
| image | Image ID for the instance  | string | n/a | yes |
| profile | Profile type for the Instance  | string | n/a | yes |
| ssh\_keys | List of ssh key IDs to the instance  | list(string) | n/a | yes |
| primary\_network\_interface | List of primary_network_interface that are to be attached to the instance  | object | n/a | yes |
| user\_data | User Data for the instance  | string | n/a | no |
| boot\_volume | List of boot volume that are to be attached to the instance| object | n/a | no |
| network\_interfaces | List of network_interfaces that are to be attached to the instance  | object | n/a | no |
| data\_volumes | List of volume ids that are to be attached to the instance  | list(string) | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of primary_network_interface, network_interfaces, boot_volume, tags, ssh_keys, data_volumes to be attached to the instance by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.