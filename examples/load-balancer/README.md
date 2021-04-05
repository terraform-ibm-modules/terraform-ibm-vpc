# Load Balancer Module Example

This example illustrates how to use the `load-balancer` module.

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
| resource\_group | ID of the resource group | string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |
| load\_balancer | Existing Load Balancer's ID to which pools/listeners are to be attached | string | n/a | no |
| lb\_pools | List of Load Balancer Pools | list(object) | n/a | no |
| lb\_pool\_members | List of Load Balancer Pool Members | list(object) | n/a | no |
| lb\_listeners | List of Load Balancer Listeners | list(object) | n/a | no |
| lb\_listener\_policies | List of Load Balancer Listener Policies | list(object) | n/a | no |
| lb\_listener\_policy\_rules | List of Load Balancer Listener Policie Rules | list(object) | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of subnets, security_groups, tags, pools, listeners, listener_policies, listener_policy_rules to be attached to the Load balancer resources by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.