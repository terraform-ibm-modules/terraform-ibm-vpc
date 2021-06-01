# VPN Gateway Module

This example illustrates how to use the `vpn_gateway` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| create\_vpn\_gateway | True to create new VPN Gateway. False if VPN Gateway is already existing and VPN Gateway connections are to be added | bool | n/a | yes |
| name | Name of the VPN Gateway. Required if creating a new Gateway | string | n/a | no |\
| subnet | Subnet id for the Gateway. Required if creating a new Gateway | string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |
| vpn\_gateway | Existing VPN Gatewayp's ID to which connections are to be attached | string | n/a | no |
| connections | VPN Gateway connections | list | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a VPN Gateway by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.