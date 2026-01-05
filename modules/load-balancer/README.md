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
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.79.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_lb.lbs](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb) | resource |
| [ibm_is_lb_listener.lb_listeners](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener) | resource |
| [ibm_is_lb_listener_policy.lb_listener_policies](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener_policy) | resource |
| [ibm_is_lb_listener_policy_rule.lb_listener_policy_rules](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener_policy_rule) | resource |
| [ibm_is_lb_pool.lb_pools](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool) | resource |
| [ibm_is_lb_pool_member.lb_members](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool_member) | resource |
| [ibm_is_lb.lb_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_lb) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_load_balancer"></a> [create\_load\_balancer](#input\_create\_load\_balancer) | True to create new Load Balancer. False if Load Balancer is already existing and Load Balancer pools/listeners are to be added | `bool` | n/a | yes |
| <a name="input_lb_listeners"></a> [lb\_listeners](#input\_lb\_listeners) | List of Load Balancer Listeners | <pre>list(object({<br/>    port                  = number<br/>    protocol              = string<br/>    default_pool          = string<br/>    certificate_instance  = string<br/>    connection_limit      = number<br/>    accept_proxy_protocol = bool<br/>    lb_listener_policies = list(object({<br/>      name                    = string<br/>      action                  = string<br/>      priority                = number<br/>      target_id               = string<br/>      target_http_status_code = number<br/>      target_url              = string<br/>      rules = object({<br/>        condition = string<br/>        type      = string<br/>        field     = string<br/>        value     = string<br/>      })<br/>      lb_listener_policy_rules = list(object({<br/>        name      = string<br/>        condition = string<br/>        type      = string<br/>        field     = string<br/>        value     = string<br/>      }))<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_lb_pools"></a> [lb\_pools](#input\_lb\_pools) | List of Load Balancer Pool | <pre>list(object({<br/>    name                            = string<br/>    algorithm                       = string<br/>    protocol                        = string<br/>    health_delay                    = number<br/>    health_retries                  = number<br/>    health_timeout                  = number<br/>    health_type                     = string<br/>    health_monitor_url              = string<br/>    health_monitor_port             = number<br/>    session_persistence_type        = string<br/>    session_persistence_cookie_name = string<br/>    lb_pool_members = list(object({<br/>      port           = number<br/>      target_address = string<br/>      target_id      = string<br/>      weight         = number<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | Existing Load Balancer's name to which pools/listeners are to be attached. | `string` | `null` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Logging of Load Balancer. Conflicts with 'profile' | `bool` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Load Balancer | `string` | `null` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | The profile to use for this load balancer. Conflicts with 'logging' | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Load Balancer securitygroups list | `list(string)` | `null` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Load Balancer subnets list | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Load Balancer | `list(string)` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of Load balancer | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | The ID of the Load balancer |
| <a name="output_lb_listener_policies"></a> [lb\_listener\_policies](#output\_lb\_listener\_policies) | All IDs of Load balancer Listener Policies |
| <a name="output_lb_listener_policy_rules"></a> [lb\_listener\_policy\_rules](#output\_lb\_listener\_policy\_rules) | All IDs of Load balancer Listener Policy Rules |
| <a name="output_lb_listeners"></a> [lb\_listeners](#output\_lb\_listeners) | All IDs of Load balancer Listeners |
| <a name="output_lb_pool_members"></a> [lb\_pool\_members](#output\_lb\_pool\_members) | All IDs of Load balancer Pool Members |
| <a name="output_lb_pools"></a> [lb\_pools](#output\_lb\_pools) | All IDs of Load balancer Pools |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
