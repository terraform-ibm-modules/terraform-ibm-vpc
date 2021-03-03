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


## Outputs

| Name | Description |
|------|-------------|
| vpn\_gateway\_connection\_id | The ID of the VPN Gateway Connection |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
