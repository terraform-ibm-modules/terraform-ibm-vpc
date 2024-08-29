# VPN Gateway Module

This example illustrates how to use the `vpn_gateway` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.49.0, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpn_gateway"></a> [vpn\_gateway](#module\_vpn\_gateway) | ../../modules/vpn-gateway | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connections"></a> [connections](#input\_connections) | List of connections for the VPN Gateway | `list` | `[]` | no |
| <a name="input_create_vpn_gateway"></a> [create\_vpn\_gateway](#input\_create\_vpn\_gateway) | True to create new VPN Gateway. False if VPN Gateway is already existing and VPN Gateway connections are to be added | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the VPN Gateway | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | Subnet id for the Gateway | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of tags. | `list(string)` | `null` | no |
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | Existing Gateway ID to which connections are to be attached | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_gateway_connections"></a> [vpn\_gateway\_connections](#output\_vpn\_gateway\_connections) | The VPN Gateway Connections |
| <a name="output_vpn_gateway_id"></a> [vpn\_gateway\_id](#output\_vpn\_gateway\_id) | The ID of the VPN Gateway |
| <a name="output_vpn_gateway_public_ip"></a> [vpn\_gateway\_public\_ip](#output\_vpn\_gateway\_public\_ip) | The public IP address assigned to the VPN gateway |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a VPN Gateway by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
