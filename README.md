
# IBM Cloud VPC module

[![Graduated (Supported)](https://img.shields.io/badge/Status-Graduated%20(Supported)-brightgreen)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-secrets-manager-private-cert-engine?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-secrets-manager-private-cert-engine/releases/latest)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

This module creates the following IBM Cloud&reg; Virtual Private Cloud (VPC) network components:
- VPC: Creates a VPC in a resource group and supports classic access. The VPC and components are specified in the [main.tf](main.tf) file.
- Public gateways: Optionally create public gateways in the VPC in each of the three zones of the VPC's region.
- Subnets: Create one to three zones in the [subnet.tf](subnet.tf) file.
- Network ACLs: Create network ACLs with multiple rules. By default, VPC network ACLs can have no more than 25 rules.

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-vpc](#terraform-ibm-vpc)
* [Examples](./examples)
    * [Basic example](./examples/complete)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->



<!-- Replace this heading with the name of the root level module (the repo name) -->
## terraform-ibm-vpc

### Usage


```hcl
module "vpc" {
    source              = "terraform-ibm-modules/vpc/ibm"
    version             = "X.X.X" # Replace "X.X.X" with a release version to lock into a specific release
    resource_group_id = module.resource_group.resource_group_id
    vpc_name          = var.vpc_name
    locations         = var.locations
    network_acls      = var.network_acls
}
```

### Required IAM access policies
You need the following permissions to run this module.

- IAM services
    - **VPC Infrastructure** services
        - `Editor` platform access
    - **No service access**
        - **Resource Group** \<your resource group>
        - `Viewer` resource group access

To attach access management tags to resources in this module, you need the following permissions.

- IAM Services
    - **Tagging** service
        - `Administrator` platform access



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
| [ibm_is_network_acl.network_acl](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_network_acl) | resource |
| [ibm_is_public_gateway.public_gateway](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_public_gateway) | resource |
| [ibm_is_security_group_rule.default_vpc_rule](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_subnet.subnet](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc) | resource |
| [ibm_is_vpc_address_prefix.vpc_address_prefixes](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc_address_prefix) | resource |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_vpc) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_assign_address_prefix"></a> [auto\_assign\_address\_prefix](#input\_auto\_assign\_address\_prefix) | Set to true to create a default address prefix automatically for each zone in the VPC. | `bool` | `true` | no |
| <a name="input_clean_default_sg_acl"></a> [clean\_default\_sg\_acl](#input\_clean\_default\_sg\_acl) | Remove all rules from the default VPC security group and VPC ACL (less permissive) | `bool` | `false` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | Indicates whether user wants to use an existing vpc or create a new one. Set it to true to create a new vpc | `bool` | `true` | no |
| <a name="input_default_network_acl_name"></a> [default\_network\_acl\_name](#input\_default\_network\_acl\_name) | Name of the default network access control list (ACL). | `string` | `null` | no |
| <a name="input_default_routing_table_name"></a> [default\_routing\_table\_name](#input\_default\_routing\_table\_name) | Name of the Default Routing Table | `string` | `null` | no |
| <a name="input_default_security_group_name"></a> [default\_security\_group\_name](#input\_default\_security\_group\_name) | Name of the Default Security Group | `string` | `null` | no |
| <a name="input_default_security_group_rules"></a> [default\_security\_group\_rules](#input\_default\_security\_group\_rules) | A list of security group rules to be added to the default vpc security group (default empty) | <pre>list(<br>    object({<br>      name      = string<br>      direction = string<br>      remote    = string<br>      tcp = optional(<br>        object({<br>          port_max = optional(number)<br>          port_min = optional(number)<br>        })<br>      )<br>      udp = optional(<br>        object({<br>          port_max = optional(number)<br>          port_min = optional(number)<br>        })<br>      )<br>      icmp = optional(<br>        object({<br>          type = optional(number)<br>          code = optional(number)<br>        })<br>      )<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_enable_classic_access"></a> [enable\_classic\_access](#input\_enable\_classic\_access) | Set to true to create a VPC that can connect to classic infrastructure resources. | `bool` | `false` | no |
| <a name="input_existing_vpc_id"></a> [existing\_vpc\_id](#input\_existing\_vpc\_id) | The ID of the existing vpc. Required if 'create\_vpc' is false. | `string` | `null` | no |
| <a name="input_locations"></a> [locations](#input\_locations) | A list of location configurations, each defining details for a specific zone. Each location may include address prefixes, public gateway settings, and subnet configurations. | <pre>list(object({<br>    zone = string<br>    address_prefix = optional(object({<br>      name = optional(string, null)<br>      cidr = string<br>    }), null)<br><br>    public_gateway = optional(object({<br>      name        = optional(string, null)<br>      floating_ip = optional(map(string), null)<br>      tags        = optional(list(string), [])<br>    }), null)<br><br>    subnets = optional(list(object({<br>      name                  = string<br>      access_tags           = optional(list(string), [])<br>      ipv4_cidr_block       = string<br>      network_acl           = optional(string, null)<br>      attach_public_gateway = optional(bool, false)<br>      tags                  = optional(list(string), [])<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | The list of ACLs to create. Provide at least one rule for each ACL. | <pre>list(<br>    object({<br>      name = string<br>      rules = list(<br>        object({<br>          name        = string<br>          action      = string<br>          destination = string<br>          direction   = string<br>          source      = string<br>          tcp = optional(<br>            object({<br>              port_max        = optional(number)<br>              port_min        = optional(number)<br>              source_port_max = optional(number)<br>              source_port_min = optional(number)<br>            })<br>          )<br>          udp = optional(<br>            object({<br>              port_max        = optional(number)<br>              port_min        = optional(number)<br>              source_port_max = optional(number)<br>              source_port_min = optional(number)<br>            })<br>          )<br>          icmp = optional(<br>            object({<br>              type = optional(number)<br>              code = optional(number)<br>            })<br>          )<br>        })<br>      )<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The resource group ID where the VPC to be created. | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the vpc | `string` | `null` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | List of tags to associate with the VPC. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_prefix"></a> [address\_prefix](#output\_address\_prefix) | Map of address prefix created. |
| <a name="output_default_security_group"></a> [default\_security\_group](#output\_default\_security\_group) | Map of default security group created. |
| <a name="output_network_acl"></a> [network\_acl](#output\_network\_acl) | Map of network ACLs created. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Map of subnets created. |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | Information of newly created or existing VPC instace. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
