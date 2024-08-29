# Load Balancer Module Example

This example illustrates how to use the `load-balancer` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.23.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_load-balancer"></a> [load-balancer](#module\_load-balancer) | ../../modules/load-balancer | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.23.0/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_load_balancer"></a> [create\_load\_balancer](#input\_create\_load\_balancer) | True to create new Load Balancer. False if Load Balancer is already existing and Load Balancer pools/listeners are to be added | `bool` | n/a | yes |
| <a name="input_lb_listeners"></a> [lb\_listeners](#input\_lb\_listeners) | List of Load Balancer Listeners | `list` | `[]` | no |
| <a name="input_lb_pools"></a> [lb\_pools](#input\_lb\_pools) | List of Load Balancer Pool | `list` | `[]` | no |
| <a name="input_load_balancer"></a> [load\_balancer](#input\_load\_balancer) | Existing Load Balancer's name to which pools/listeners are to be attached. | `string` | `null` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Logging of Load Balancer. Conflicts with 'profile' | `bool` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Load Balancer | `string` | `null` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | The profile to use for this load balancer. Conflicts with 'logging' | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group Name | `string` | `null` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Load Balancer securitygroups list | `list(string)` | `null` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Load Balancer subnets list | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the Load Balancer | `list(string)` | `[]` | no |
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

NOTE: We can configure the list of subnets, security_groups, tags, pools, listeners, listener_policies, listener_policy_rules to be attached to the Load balancer resources by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.
