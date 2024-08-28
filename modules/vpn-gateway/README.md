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
  vpn_gateway        = var.vpn_gateway
  connections        = var.connections
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_vpn_gateway.vpngw](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpn_gateway) | resource |
| [ibm_is_vpn_gateway_connection.vpngw_connections](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpn_gateway_connection) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connections"></a> [connections](#input\_connections) | List of connections for the VPN Gateway | <pre>list(object({<br>    name           = string<br>    peer_address   = string<br>    preshared_key  = string<br>    local_cidrs    = list(string)<br>    peer_cidrs     = list(string)<br>    admin_state_up = bool<br>    action         = string<br>    interval       = number<br>    timeout        = number<br>    ike_policy     = string<br>    ipsec_policy   = string<br>  }))</pre> | `[]` | no |
| <a name="input_create_vpn_gateway"></a> [create\_vpn\_gateway](#input\_create\_vpn\_gateway) | True to create new VPN Gateway. False if VPN Gateway is already existing and VPN Gateway connections are to be added | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPN Gateway | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of resource group. | `string` | `null` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | Subnet id for the Gateway | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the VPN Gateway | `list(string)` | `[]` | no |
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | Existing Gateway ID to which connections are to be attached | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_gateway_connections"></a> [vpn\_gateway\_connections](#output\_vpn\_gateway\_connections) | The VPN Gateway Connections |
| <a name="output_vpn_gateway_id"></a> [vpn\_gateway\_id](#output\_vpn\_gateway\_id) | The ID of the VPN Gateway |
| <a name="output_vpn_gateway_public_ip"></a> [vpn\_gateway\_public\_ip](#output\_vpn\_gateway\_public\_ip) | The public IP address assigned to the VPN gateway |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
