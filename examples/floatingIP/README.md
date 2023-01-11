# Floating IP Example

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

## Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.41.1/docs/data-sources/resource_group) | data source |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fip"></a> [fip](#module\_fip) | ./../../modules/fip | n/a |

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Floating IP | `string` | n/a | yes |
| <a name="input_location"></a> [ibm\_location](#input\_ibm\_location) | Floating IP Zone. This conflicts with 'target'. Give only either of one" | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group name | `string` | `null` | no |
| <a name="input_target"></a> [target](#input\_target) | Target Interface ID for this Floating IP. This conflicts with 'zone'. Give only either of one | `string` | `null` | no |
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
