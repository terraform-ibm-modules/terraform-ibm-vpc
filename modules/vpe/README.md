# Virtual Endpoint Gateway Module Example

This module is used to create Virtual Endpoint Gateway and IPs

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  count = var.create_endpoint_gateway ? 1 : 0
  name  = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "vpe" {
  source = "terraform-ibm-modules/vpc/ibm//modules/vpe"

  create_endpoint_gateway = var.create_endpoint_gateway
  name                    = var.name
  vpc_id                  = var.create_endpoint_gateway ? data.ibm_is_vpc.vpc[0].id : null
  resource_group_id       = data.ibm_resource_group.resource_group.id
  target                  = var.target
  ips                     = var.ips
  tags                    = var.tags
  endpoint_gateway        = var.endpoint_gateway
  reserved_ips            = var.reserved_ips
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_virtual_endpoint_gateway.endpoint_gateway](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_virtual_endpoint_gateway) | resource |
| [ibm_is_virtual_endpoint_gateway_ip.virtual_endpoint_gateway_ips](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_virtual_endpoint_gateway_ip) | resource |
| [ibm_is_virtual_endpoint_gateway.vpe_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_virtual_endpoint_gateway) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_endpoint_gateway"></a> [create\_endpoint\_gateway](#input\_create\_endpoint\_gateway) | True to create new endpoint gateway. False if endpoint gateway is already existing and endpoint gateway ips are to be added | `bool` | n/a | yes |
| <a name="input_endpoint_gateway"></a> [endpoint\_gateway](#input\_endpoint\_gateway) | Existing Enpoint Gateway's Name to which Reserved IPs are to be attached | `string` | `null` | no |
| <a name="input_ips"></a> [ips](#input\_ips) | Gateway IPs | <pre>list(object({<br/>    id     = string<br/>    name   = string<br/>    subnet = string<br/>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the new Endpoint Gateway | `string` | `null` | no |
| <a name="input_reserved_ips"></a> [reserved\_ips](#input\_reserved\_ips) | List of New reserved IPs to the Endpoint Gateway | <pre>list(object({<br/>    reserved_ip = string<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Endpoint Gateway | `list(string)` | `[]` | no |
| <a name="input_target"></a> [target](#input\_target) | Gateway target | <pre>list(object({<br/>    resource_type = string<br/>    name          = string<br/>    crn           = string<br/>  }))</pre> | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID of the new Endpoint Gateway | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_gateway_id"></a> [endpoint\_gateway\_id](#output\_endpoint\_gateway\_id) | The ID of the endpoint gateway |
| <a name="output_endpoint_gateway_ips"></a> [endpoint\_gateway\_ips](#output\_endpoint\_gateway\_ips) | The ID of the endpoint gateway IPs |
| <a name="output_endpoint_gateway_target"></a> [endpoint\_gateway\_target](#output\_endpoint\_gateway\_target) | The ID of the endpoint gateway target |
| <a name="output_gateway_reserved_ips"></a> [gateway\_reserved\_ips](#output\_gateway\_reserved\_ips) | All the Gateway Reserved IPs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
