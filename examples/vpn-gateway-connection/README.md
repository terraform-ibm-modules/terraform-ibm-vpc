# VPN Gateway Connection Module Example

This example illustrates how to use the `vpc_gateway_connection` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc_gateway_connection"></a> [vpc\_gateway\_connection](#module\_vpc\_gateway\_connection) | ../../modules/vpn-gateway-connection | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action"></a> [action](#input\_action) | Dead peer detection actions | `string` | `null` | no |
| <a name="input_admin_state_up"></a> [admin\_state\_up](#input\_admin\_state\_up) | The VPN gateway connection status | `bool` | `null` | no |
| <a name="input_ike_policy"></a> [ike\_policy](#input\_ike\_policy) | The ID of the IKE policy | `string` | `null` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | Dead peer detection interval in seconds | `number` | `null` | no |
| <a name="input_ipsec_policy"></a> [ipsec\_policy](#input\_ipsec\_policy) | The ID of the IPSec policy | `string` | `null` | no |
| <a name="input_local_cidrs"></a> [local\_cidrs](#input\_local\_cidrs) | List of local CIDRs for this resource | `list(string)` | n/a | yes |
| <a name="input_peer_cidrs"></a> [peer\_cidrs](#input\_peer\_cidrs) | List of peer CIDRs for this resource | `list(string)` | n/a | yes |
| <a name="input_peer_gateway_address"></a> [peer\_gateway\_address](#input\_peer\_gateway\_address) | The IP address of the peer VPN gateway | `string` | n/a | yes |
| <a name="input_preshared_key"></a> [preshared\_key](#input\_preshared\_key) | The preshared key | `string` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Dead peer detection timeout in seconds | `number` | `null` | no |
| <a name="input_vpn_gateway_connection_name"></a> [vpn\_gateway\_connection\_name](#input\_vpn\_gateway\_connection\_name) | Name of the VPN Gateway Connection | `string` | n/a | yes |
| <a name="input_vpn_gateway_id"></a> [vpn\_gateway\_id](#input\_vpn\_gateway\_id) | VPN Gateway ID | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of local_cidrs, peer_cidrs to be attached to a VPN Gateway Connection by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.