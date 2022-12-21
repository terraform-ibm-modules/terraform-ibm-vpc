# VPN Gateway Module

This module is used to create a VPN Gateway

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  rules = [
    for r in var.connections : {
      name           = r.name
      peer_address   = r.peer_address
      preshared_key  = r.preshared_key
      local_cidrs    = r.local_cidrs
      peer_cidrs     = r.peer_cidrs
      admin_state_up = lookup(r, "admin_state_up", null)
      action         = lookup(r, "action", null)
      interval       = lookup(r, "interval", null)
      timeout        = lookup(r, "timeout", null)
      ike_policy     = lookup(r, "ike_policy", null)
      ipsec_policy   = lookup(r, "ipsec_policy", null)
    }
  ]
}

module "vpn_gateway" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpn-gateway"

  create_vpn_gateway = var.create_vpn_gateway
  name               = var.name
  resource_group_id  = data.ibm_resource_group.resource_group.id
  subnet             = var.subnet
  tags               = var.tags
  mode               = var.mode
  vpn_gateway        = var.vpn_gateway
  connections        = var.connections
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| create\_vpn\_gateway | True to create new VPN Gateway. False if VPN Gateway is already existing and VPN Gateway connections are to be added | bool | n/a | yes |
| name | Name of the VPN Gateway. Required if creating a new Gateway | string | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| subnet | Subnet id for the Gateway. Required if creating a new Gateway | string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |
| vpn\_gateway | Existing VPN Gatewayp's ID to which connections are to be attached | string | n/a | no |
| connections | VPN Gateway connections | list | n/a | no |
| mode | VPN mode | string | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| vpn\_gateway\_id | The ID of the VPN Gateway |
| vpn\_gateway\_public\_ip | The public IP address assigned to the VPN gateway |
| vpn\_gateway\_connections | The VPN Gateway Connection IDs |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->