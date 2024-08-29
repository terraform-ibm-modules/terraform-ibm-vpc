# Virtual Private Endpoint Module Example

This module is used to create a Virtual Endpoint Gateway and IPs

This example illustrates how to use the `vpe` module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.49.0, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpe"></a> [vpe](#module\_vpe) | ../../modules/vpe | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_vpc) | data source |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_endpoint_gateway"></a> [create\_endpoint\_gateway](#input\_create\_endpoint\_gateway) | True to create new endpoint gateway. False if endpoint gateway is already existing and endpoint gateway ips are to be added | `bool` | n/a | yes |
| <a name="input_endpoint_gateway"></a> [endpoint\_gateway](#input\_endpoint\_gateway) | Existing Enpoint Gateway's Name to which Reserved IPs are to be attached | `string` | `null` | no |
| <a name="input_ips"></a> [ips](#input\_ips) | Gateway IPs | `list` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the new Endpoint Gateway | `string` | `null` | no |
| <a name="input_reserved_ips"></a> [reserved\_ips](#input\_reserved\_ips) | List of New reserved IPs to the Endpoint Gateway | `any` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group Name | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Endpoint Gateway | `list(string)` | `null` | no |
| <a name="input_target"></a> [target](#input\_target) | Gateway target | `list` | `[]` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC Name of the new Endpoint Gateway | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_gateway_id"></a> [endpoint\_gateway\_id](#output\_endpoint\_gateway\_id) | The ID of the endpoint gateway |
| <a name="output_endpoint_gateway_ips"></a> [endpoint\_gateway\_ips](#output\_endpoint\_gateway\_ips) | The ID of the endpoint gateway IPs |
| <a name="output_endpoint_gateway_target"></a> [endpoint\_gateway\_target](#output\_endpoint\_gateway\_target) | The ID of the endpoint gateway target |
| <a name="output_gateway_reserved_ips"></a> [gateway\_reserved\_ips](#output\_gateway\_reserved\_ips) | All the Gateway Reserved IPs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of target, ips, reserved_ips, tags to be attached to the Gateway resources by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
