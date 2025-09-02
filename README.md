# IBM Cloud VPC module

[![Stable (With quality checks)](https://img.shields.io/badge/Status-Stable%20(With%20quality%20checks)-green)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-vpc?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-vpc/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

## Terraform Module for IBM Cloud VPC Infrastructure

This module provides a comprehensive solution for managing IBM Cloud Virtual Private Cloud (VPC) infrastructure. It includes a main module and several submodules, enabling you to create, configure, and manage VPC components either individually or through the main module.

This module is designed to provide a scalable, secure, and flexible VPC environment tailored to meet various use cases within IBM Cloud, supporting a broad range of infrastructure needs from basic networking setups to complex multi-zone architectures.

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-vpc](#terraform-ibm-vpc)
* [Submodules](./modules)
    * [floatingIP](./modules/floatingIP)
    * [image](./modules/image)
    * [instance](./modules/instance)
    * [load-balancer](./modules/load-balancer)
    * [network-acl](./modules/network-acl)
    * [public-gateway](./modules/public-gateway)
    * [security-group](./modules/security-group)
    * [ssh-key](./modules/ssh-key)
    * [subnet](./modules/subnet)
    * [volume](./modules/volume)
    * [vpc-address-prefix](./modules/vpc-address-prefix)
    * [vpc](./modules/vpc)
    * [vpe](./modules/vpe)
    * [vpn-gateway-connection](./modules/vpn-gateway-connection)
    * [vpn-gateway](./modules/vpn-gateway)
* [Examples](./examples)
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


## terraform-ibm-vpc

### Usage

```hcl
module "vpc" {
  source            = "terraform-ibm-modules/vpc/ibm"
  version           = "X.X.X" # Replace "X.X.X" with a release version to lock into a specific release

  vpc_name          = "stage-vpc"
  resource_group_id = module.resource_group.resource_group_id
  locations         = ["us-south-1", "us-south-2", "us-south-3"]
  vpc_tags          = var.resource_tags
  address_prefixes = [
    {
      name     = "stage-us-south-1"
      location = "us-south-1"
      ip_range = "10.10.10.0/24"
    },
    {
      name     = "stage-us-south-2"
      location = "us-south-2"
      ip_range = "10.10.20.0/24"
    },
    {
      name     = "stage-us-south-3"
      location = "us-south-3"
      ip_range = "10.10.30.0/24"
    }
  ]

  subnet_name_prefix          = "stage-subnet"
  default_network_acl_name    = "stage-nacl"
  default_routing_table_name  = "stage-routing-table"
  default_security_group_name = "stage-sg"
  create_gateway              = true
  public_gateway_name_prefix  = "stage-pw"
  number_of_addresses         = 16
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

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, <2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | List of Prefixes for the vpc | <pre>list(object({<br/>    name     = string<br/>    location = string<br/>    ip_range = string<br/>  }))</pre> | `[]` | no |
| <a name="input_auto_assign_address_prefix"></a> [auto\_assign\_address\_prefix](#input\_auto\_assign\_address\_prefix) | Set to true to create a default address prefix automatically for each zone in the VPC. | `bool` | `true` | no |
| <a name="input_clean_default_sg_acl"></a> [clean\_default\_sg\_acl](#input\_clean\_default\_sg\_acl) | Remove all rules from the default VPC security group and VPC ACL (less permissive) | `bool` | `false` | no |
| <a name="input_create_gateway"></a> [create\_gateway](#input\_create\_gateway) | True to create new Gateway | `bool` | `false` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | True to create new VPC. False if VPC is already existing and subnets or address prefixies are to be added | `bool` | `true` | no |
| <a name="input_default_network_acl_name"></a> [default\_network\_acl\_name](#input\_default\_network\_acl\_name) | Name of the Default ACL | `string` | `"default-network-acl"` | no |
| <a name="input_default_routing_table_name"></a> [default\_routing\_table\_name](#input\_default\_routing\_table\_name) | Name of the Default Routing Table | `string` | `"default_routing_table"` | no |
| <a name="input_default_security_group_name"></a> [default\_security\_group\_name](#input\_default\_security\_group\_name) | Name of the Default Security Group | `string` | `"default_security_group"` | no |
| <a name="input_existing_vpc_name"></a> [existing\_vpc\_name](#input\_existing\_vpc\_name) | Name of the Existing VPC to which subnets, gateways are to be attached, only used when `var.create_vpc` is false | `string` | `null` | no |
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | Floating IP `id`'s or `address`'es that you want to assign to the public gateway | `map(any)` | `{}` | no |
| <a name="input_gateway_tags"></a> [gateway\_tags](#input\_gateway\_tags) | List of Tags for the gateway | `list(string)` | `[]` | no |
| <a name="input_locations"></a> [locations](#input\_locations) | zones per region | `list(string)` | `[]` | no |
| <a name="input_number_of_addresses"></a> [number\_of\_addresses](#input\_number\_of\_addresses) | Number of IPV4 Addresses | `number` | `null` | no |
| <a name="input_public_gateway_name_prefix"></a> [public\_gateway\_name\_prefix](#input\_public\_gateway\_name\_prefix) | Prefix to the names of the Public Gateways | `string` | `"public_gateway"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of resource group. | `string` | `null` | no |
| <a name="input_subnet_name_prefix"></a> [subnet\_name\_prefix](#input\_subnet\_name\_prefix) | Prefix to the names of subnets | `string` | `"subnet"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the vpc | `string` | `null` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | List of Tags for the vpc | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | List of subnets associated with the VPC |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | Configuration of newly created or existing VPC instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
