# Security Group Module Example

This module is used to create a Security Group

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  count = var.create_security_group ? 1 : 0
  name  = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  rules = [
    for r in var.security_group_rules : {
      name       = r.name
      direction  = r.direction
      remote     = lookup(r, "remote", null)
      ip_version = lookup(r, "ip_version", null)
      icmp       = lookup(r, "icmp", null)
      tcp        = lookup(r, "tcp", null)
      udp        = lookup(r, "udp", null)
    }
  ]
}

module "security_group" {
  source = "terraform-ibm-modules/vpc/ibm//modules/security-group"

  create_security_group = var.create_security_group
  name                  = var.name
  vpc_id                = var.create_security_group ? data.ibm_is_vpc.vpc[0].id : null
  resource_group_id     = data.ibm_resource_group.resource_group.id
  security_group        = var.security_group
  security_group_rules  = local.rules
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_security_group.sg](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group) | resource |
| [ibm_is_security_group_rule.sg_rules](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group.sg_ds](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_security_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | True to create new security group. False if security group is already existing and security group rules are to be added | `bool` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the new Security Group | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_security_group"></a> [security\_group](#input\_security\_group) | Existing Security Group's name to which rules are to be attached. | `string` | `null` | no |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | Security Group rules | <pre>list(object({<br>    name       = string<br>    direction  = string<br>    remote     = string<br>    ip_version = string<br>    icmp = object({<br>      code = number<br>      type = number<br>    })<br>    tcp = object({<br>      port_max = number<br>      port_min = number<br>    })<br>    udp = object({<br>      port_max = number<br>      port_min = number<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID of the new security group | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the Security group |
| <a name="output_security_group_rules"></a> [security\_group\_rules](#output\_security\_group\_rules) | All the IDs of Security group Rules |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
