# VPN Gateway Connection Module

This module is used to create a VPN Gateway Connection

## Example Usage
```

module "vpc_gateway_connection" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpn-gateway-connection"

  vpn_gateway_connection_name = var.vpn_gateway_connection_name
  vpn_gateway_id              = var.vpn_gateway_id
  peer_gateway_address        = var.peer_gateway_address
  preshared_key               = var.preshared_key
  local_cidrs                 = var.local_cidrs
  peer_cidrs                  = var.peer_cidrs
  admin_state_up              = var.admin_state_up
  action                      = var.action
  interval                    = var.interval
  timeout                     = var.timeout
  ike_policy                  = var.ike_policy
  ipsec_policy                = var.ipsec_policy
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.79.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_vpn_gateway_connection.vpngw_connection](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpn_gateway_connection) | resource |

### Inputs

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

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_gateway_connection_id"></a> [vpn\_gateway\_connection\_id](#output\_vpn\_gateway\_connection\_id) | The ID of the VPN Gateway Connection |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
