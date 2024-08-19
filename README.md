<!-- Update this title with a descriptive name. Use sentence case. -->
# Terraform modules template project

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Incubating (Not yet consumable)](https://img.shields.io/badge/status-Incubating%20(Not%20yet%20consumable)-red)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-module-template?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-module-template/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!--
Add a description of modules in this repo.
Expand on the repo short description in the .github/settings.yml file.

For information, see "Module names and descriptions" at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=module-names-and-descriptions
-->

TODO: Replace this with a description of the modules in this repo.


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-vpc](#terraform-ibm-vpc)
* [Examples](./examples)
    * [Advanced example](./examples/advanced)
    * [Basic example](./examples/basic)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!--
If this repo contains any reference architectures, uncomment the heading below and link to them.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->
<!-- ## Reference architectures -->


<!-- Replace this heading with the name of the root level module (the repo name) -->
## terraform-ibm-module-template

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl

```

### Required IAM access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the sample Account and IBM Cloud service names and roles with the
information in the console at
Manage > Access (IAM) > Access groups > Access policies.
-->

<!--
You need the following permissions to run this module:

- IAM services
    - **Sample IBM Cloud** service
        - `Editor` platform access
        - `Manager` platform access
- Account management services
    - **Sample account management** service
        - `Editor` platform access
-->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_public_gateway.public_gateway](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_public_gateway) | resource |
| [ibm_is_subnet.subnet](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc) | resource |
| [ibm_is_vpc_address_prefix.vpc_address_prefixes](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc_address_prefix) | resource |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_vpc) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_assign_address_prefix"></a> [auto\_assign\_address\_prefix](#input\_auto\_assign\_address\_prefix) | Set to true to create a default address prefix automatically for each zone in the VPC. | `bool` | `false` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | Indicates whether user wants to use an existing vpc or create a new one. Set it to true to create a new vpc | `bool` | `true` | no |
| <a name="input_default_network_acl_name"></a> [default\_network\_acl\_name](#input\_default\_network\_acl\_name) | Name of the default network access control list (ACL). | `string` | `null` | no |
| <a name="input_default_routing_table_name"></a> [default\_routing\_table\_name](#input\_default\_routing\_table\_name) | Name of the Default Routing Table | `string` | `null` | no |
| <a name="input_default_security_group_name"></a> [default\_security\_group\_name](#input\_default\_security\_group\_name) | Name of the Default Security Group | `string` | `null` | no |
| <a name="input_enable_classic_access"></a> [enable\_classic\_access](#input\_enable\_classic\_access) | Set to true to create a VPC that can connect to classic infrastructure resources. | `bool` | `false` | no |
| <a name="input_existing_vpc_id"></a> [existing\_vpc\_id](#input\_existing\_vpc\_id) | The ID of the existing vpc. Required if 'create\_vpc' is false. | `string` | `null` | no |
| <a name="input_locations"></a> [locations](#input\_locations) | A list of location configurations, each defining details for a specific zone. Each location may include address prefixes, public gateway settings, and subnet configurations. | <pre>list(object({<br>    zone = string<br>    address_prefix = optional(object({<br>      name = optional(string, null)<br>      cidr = optional(string, null)<br>    }), null)<br><br>    public_gateway = optional(object({<br>      name        = optional(string, null)<br>      floating_ip = optional(map(string), null)<br>      tags        = optional(list(string), [])<br>    }), null)<br><br>    subnets = optional(list(object({<br>      name                  = string<br>      access_tags           = optional(list(string), [])<br>      ipv4_cidr_block       = string<br>      network_acl           = optional(string, null)<br>      attach_public_gateway = optional(bool, false)<br>      tags                  = optional(list(string), [])<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | The list of ACLs to create. Provide at least one rule for each ACL. | <pre>list(<br>    object({<br>      name = string<br>      rules = list(<br>        object({<br>          name        = string<br>          action      = string<br>          destination = string<br>          direction   = string<br>          source      = string<br>          tcp = optional(<br>            object({<br>              port_max        = optional(number)<br>              port_min        = optional(number)<br>              source_port_max = optional(number)<br>              source_port_min = optional(number)<br>            })<br>          )<br>          udp = optional(<br>            object({<br>              port_max        = optional(number)<br>              port_min        = optional(number)<br>              source_port_max = optional(number)<br>              source_port_min = optional(number)<br>            })<br>          )<br>          icmp = optional(<br>            object({<br>              type = optional(number)<br>              code = optional(number)<br>            })<br>          )<br>        })<br>      )<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_no_sg_acl_rules"></a> [no\_sg\_acl\_rules](#input\_no\_sg\_acl\_rules) | Set to true to delete all rules attached to default security group and default network ACL for a new VPC. This attribute has no impact on update. | `bool` | `false` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The value that you would like to prefix to the name of the resources provisioned by this module. Explicitly set to null if you do not wish to use a prefix. This value is ignored if using one of the optional variables for explicit control over naming. | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The resource group ID where the VPC to be created. | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the vpc | `string` | `null` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | List of tags to associate with the VPC. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_prefix"></a> [address\_prefix](#output\_address\_prefix) | n/a |
| <a name="output_public_gateways"></a> [public\_gateways](#output\_public\_gateways) | n/a |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
