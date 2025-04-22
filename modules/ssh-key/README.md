# Module SSH Key

This module is used to create an SSH Key

## Example Usage
```
data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "ssh-key" {
  source = "terraform-ibm-modules/vpc/ibm//modules/ssh-key"

  name              = var.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  public_key        = var.public_key
  tags              = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.64.0, <2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_is_ssh_key.ssh_key](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_ssh_key) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the SSH Key | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | SSH Public key data | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of resource group. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tags for the SSH Key | `list(string)` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_fingerprint"></a> [fingerprint](#output\_fingerprint) | SSH key Fingerprint info |
| <a name="output_ssh_key_id"></a> [ssh\_key\_id](#output\_ssh\_key\_id) | The ID of the ssh key |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
