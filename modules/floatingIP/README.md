# Floating IP Module

This example is used to create a floating IP address that you can associate with a Virtual Servers for VPC instance.

## Example Usage

``` terraform
provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = "default"
}

module "fip" {
  # source = "terraform-ibm-modules/vpc/ibm//modules/floatingIP"
  source = "../../modules/floatingIP"

  name              = "fip"
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = "us-south"
  tags              = ["t1","t2"]
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_is_floating_ip.fip](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_floating_ip) | resource |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Floating IP | `string` | n/a | yes |
| <a name="input_location"></a> [ibm\_location](#input\_ibm\_location) | Floating IP Zone. This conflicts with 'target'. Give only either of one" | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_target"></a> [target](#input\_target) | Target Interface ID for this Floating IP. This conflicts with 'zone'. Give only either of one | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Floating IP | `list(string)` | `null` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_floating_ip_id"></a> [floating\_ip\_id](#output\_floating\_ip\_id) | Floating ip ID |
