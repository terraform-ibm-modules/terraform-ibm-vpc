# Network ACL Module Example

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
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_group) | data source |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_vpc) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_acl"></a> [network\_acl](#module\_network\_acl) | ./../../modules/network-acl | n/a |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Network ACL | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC name | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | List of rules that are to be attached to the Network ACL | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Floating IP | `list(string)` | `null` | no |


## Outputs

No outputs

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
