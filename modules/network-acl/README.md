# Network ACL Module

Create, update, or delete a Virtual Servers for VPC instance. For more information, about managing VPC instance, see about virtual server instances for VPC.

## Example Usage

``` terraform
provider "ibm" {
}

data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "network_acl" {
  # source = "terraform-ibm-modules/vpc/ibm//modules/network-acl"
  source = "../../modules/network-acl"

  name              = var.name
  vpc_id            = data.ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.resource_group.id
  rules             = local.rules
  tags              = var.tags
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.41.1 |

## Resources

| Name | Type |
|------|------|
| [ibm_is_network_acl.nwacl](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_network_acl) | resource |

## Modules

No modules.

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Network ACL | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | List of rules that are to be attached to the Network ACL | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Floating IP | `list(string)` | `null` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_acl_id"></a> [network\_acl\_id](#output\_network\_acl\_id) | ID of the Network ACL |


## Usage

```
terraform init
```
```
terraform plan
```
```
terraform apply
```
