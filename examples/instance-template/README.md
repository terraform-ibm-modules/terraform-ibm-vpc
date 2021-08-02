# Instance Template Example

This example illustrates how to use the `instance-template` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the Instance Template | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the subnet  | string | n/a | yes |
| image | Image ID for the Instance Template  | string | n/a | yes |
| profile | Profile type for the Instance Template | string | n/a | yes |
| ssh\_keys | List of ssh key IDs to the Instance Template  | list(string) | n/a | yes |
| primary\_network\_interface | List of primary_network_interface that are to be attached to the Instance Template  | list(object) | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| user\_data | User Data for the Instance Template  | string | n/a | no |
| boot\_volume | List of boot volume that are to be attached to the Instance Template| list(object) | n/a | no |
| network\_interfaces | List of network_interfaces that are to be attached to the Instance Template  | list(object) | n/a | no |
| volume\_attachments | List of volume Attachments that are to be attached to the instance Template  | list(object) | n/a | no |
| dedicated\_host | Unique Identifier of the Dedicated Host where the instance will be placed | string | n/a | no |
| dedicated\_host\_group | Unique Identifier of the Dedicated Host Group where the instance will be placed  | string | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of primary_network_interface, network_interfaces, boot_volume, ssh_keys, volume_attachments to be attached to the instance by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.