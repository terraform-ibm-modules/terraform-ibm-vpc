# VPC Load-Balancer Module

Create, update, or delete a VPC Load Balancer. For more information, about VPC load balancer, see [load balancers for VPC overview](https://cloud.ibm.com/docs/vpc?topic=vpc-nlb-vs-elb)

## Example Usage

``` terraform
provider "ibm" {
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "load_balancer" {
  # source = "terraform-ibm-modules/vpc/ibm//modules/load_balancer"
  source = "../../modules/load_balancer"

  create_load_balancer = var.create_load_balancer
  name                 = var.name
  resource_group_id    = data.ibm_resource_group.resource_group.id
  subnets              = var.subnets
  security_groups      = var.security_groups
  type                 = var.type
  profile              = var.profile
  logging              = var.logging
  tags                 = var.tags
  load_balancer        = var.load_balancer
  lb_pools             = local.lb_pools
  lb_listeners         = local.lb_listeners
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
| [ibm_is_lb.lb_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_lb) | data-source |
| [ibm_is_lb.lbs](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb) | resource |
| [ibm_is_lb_pool.lb_pools](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool) | resource |
| [ibm_is_lb_pool_member.lb_members](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool_member) | resource |
| [ibm_is_lb_listener.lb_listeners](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener) | resource |
| [ibm_is_lb_listener_policy.lb_listener_policies](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener_policy) | resource |
| [ibm_is_lb_listener_policy_rule.](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener_policy_rule) | resource |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_load_balancer"></a> [create_load_balancer](#input\_create\_load\_balancer) | True to create new Load Balancer. False if Load Balancer is already existing and Load Balancer pools/listeners are to be added. | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the load-balancer | `string` | `null` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of load-balancer subnets | `list(string)` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of load-balancer| `string` | `null` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of load balancer security groups | `list(string)` | `null` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | The profile to use for this load balancer. Conflicts with 'logging' | `string` | `null` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Logging of Load Balancer. Conflicts with 'profile' | `bool` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of the resource group. | `string` | `null` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | Existing Load Balancer's name to which pools/listeners are to be attached. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Floating IP | `list(string)` | `null` | no |
| <a name="input_lb_pools"></a> [lb\_pools](#input\_lb\_pools) | List of Load Balancer Pool | `list(string)` | `[]` | no |
| <a name="input_lb_listeners"></a> [lb\_listeners](#input\_lb\_listeners) | List of Load Balancer Listeners | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | ID of the Load balancer |
| <a name="output_lb_pools"></a> [lb\_pools](#output\_lb\_pools) | All IDs of Load balancer Pools |
| <a name="output_lb_pool_members"></a> [lb\_pool\_members](#output\_lb\_pool\_members) | All IDs of Load balancer Pool Members |
| <a name="output_lb_listeners"></a> [lb\_listeners](#output\_lb\_listeners) | All IDs of Load balancer Listeners |
| <a name="output_lb_listener_policies"></a> [lb\_listener\_policies](#output\_lb\_listener\_policies) | All IDs of Load balancer Listener Policies |
| <a name="output_lb_listener_policy_rules"></a> [lb\_listener\_policy\_rules](#output\_lb\_listener\_policy\_rules) | All IDs of Load balancer Listener Policy Rules |


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
