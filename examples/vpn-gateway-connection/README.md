# VPN Gateway Connection Module Example

This example illustrates how to use the `vpc_gateway_connection` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| vpn\_gateway\_connection\_name | Name of the VPN Gateway Connection | string | n/a | yes |
| vpn\_gateway\_id | VPN Gateway id | string | n/a | yes |
| peer\_gateway\_address | The IP address of the peer VPN gateway | string | n/a | yes |
| preshared\_key | The preshared key | string | n/a | yes |
| local\_cidrs | List of local CIDRs for this resource | list(string) | n/a | yes |
| peer\_cidrs | List of peer CIDRs for this resource | list(string) | n/a | yes |
| admin\_state\_up | The VPN gateway connection status | bool | false | no |
| action | Dead peer detection actions. Supported values are `restart`, `clear`, `hold`, `none` | string | none | no |
| interval | Dead peer detection interval in seconds | number | 30 | no |
| timeout | Dead peer detection timeout in seconds | number | 120 | no |
| ike\_policy | The ID of the IKE policy | string | n/a | no |
| ipsec\_policy | The ID of the IPSec policy | string | n/a | no |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of local_cidrs, peer_cidrs to be attached to a VPN Gateway Connection by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.