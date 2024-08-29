# Network ACL Module Example

This module is used to create a Network ACL

## Example Usage
```
data "ibm_is_vpc" "vpc" {
  name = var.vpc
}

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

locals {
  rules = [
    for r in var.rules : {
      name        = r.name
      action      = r.action
      source      = r.source
      destination = r.destination
      direction   = r.direction
      icmp        = lookup(r, "icmp", null)
      tcp         = lookup(r, "tcp", null)
      udp         = lookup(r, "udp", null)
    }
  ]
}

module "network_acl" {
  source = "terraform-ibm-modules/vpc/ibm//modules/network-acl"

  name              = var.name
  vpc_id            = data.ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.resource_group.id
  rules             = local.rules
  tags              = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.63.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_network_acl.nwacl](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_network_acl) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Network ACL | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource group ID | `string` | `null` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | List of rules that are to be attached to the Network ACL | <pre>list(object({<br>    name        = string<br>    action      = string<br>    source      = string<br>    destination = string<br>    direction   = string<br>    icmp = object({<br>      code = number<br>      type = number<br>    })<br>    tcp = object({<br>      port_max        = number<br>      port_min        = number<br>      source_port_max = number<br>      source_port_min = number<br>    })<br>    udp = object({<br>      port_max        = number<br>      port_min        = number<br>      source_port_max = number<br>      source_port_min = number<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the ACL | `list(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_acl_id"></a> [network\_acl\_id](#output\_network\_acl\_id) | The ID of the Network ACL |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
