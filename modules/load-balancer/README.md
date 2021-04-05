# Load Balancer Module Example

This module is used to create Load Balancer Resources

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "load-balancer" {
  source = "terraform-ibm-modules/vpc/ibm//modules/load-balancer"

  create_load_balancer     = var.create_load_balancer
  name                     = var.name
  resource_group_id        = data.ibm_resource_group.resource_group.id
  subnets                  = var.subnets
  security_groups          = var.security_groups
  type                     = var.type
  profile                  = var.profile
  logging                  = var.logging
  tags                     = var.tags
  load_balancer            = var.load_balancer
  lb_pools                 = var.lb_pools
  lb_pool_members          = var.lb_pool_members
  lb_listeners             = var.lb_listeners
  lb_listener_policies     = var.lb_listener_policies
  lb_listener_policy_rules = var.lb_listener_policy_rules
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| create\_load\_balancer | True to create new Load Balancer. False if Load Balancer is already existing and Load Balancer pools/listeners are to be added | bool | n/a | yes |
| name | Name of the new Load Balancer. Required if creating a new Load Balancer | string | n/a | no |
| subnets | Load Balancer subnets list. Required if creating a new Load Balancer | list(string) | n/a | no |
| type | Type of Load balancer | string | n/a | no |
| profile | The profile to use for this load balancer. Conflicts with 'logging' | string | n/a | no |
| logging | Logging of Load Balancer. Conflicts with 'profile' | bool | n/a | no |
| security\_groups | Load Balancer Security Group list | list(string) | n/a | no |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |
| load\_balancer | Existing Load Balancer's ID to which pools/listeners are to be attached | string | n/a | no |
| lb\_pools | List of Load Balancer Pools | list(object) | n/a | no |
| lb\_pool\_members | List of Load Balancer Pool Members | list(object) | n/a | no |
| lb\_listeners | List of Load Balancer Listeners | list(object) | n/a | no |
| lb\_listener\_policies | List of Load Balancer Listener Policies | list(object) | n/a | no |
| lb\_listener\_policy\_rules | List of Load Balancer Listener Policie Rules | list(object) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| lb\_id | The ID of the Load balancer |
| lb\_pools | All the Load balancer Pools |
| lb\_pool\_members | All the Load balancer Pool Members |
| lb\_listeners | All the Load balancer Listeners |
| lb\_listener\_policies | All the Load balancer Listener Policies |
| lb\_listener\_policy\_rules | All the Load balancer Listener Policy Rules |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->