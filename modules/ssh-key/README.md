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

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the ssh key | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| public_key | SSH Public key data | string | n/a | yes |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| ssh\_key\_id | The ID of the SSH Key |
| fingerprint | SSH key Fingerprint info |
