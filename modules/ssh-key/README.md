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
