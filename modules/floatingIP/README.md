# Floating IP Module Example

This module is used to create a Floating IP

## Example Usage
```

data "ibm_resource_group" "resource_group" {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module "fip" {
  source = "terraform-ibm-modules/vpc/ibm//modules/floatingIP"

  name                       = var.name
  resource_group_id          = data.ibm_resource_group.resource_group.id
  location                   = var.location
  target                     = (var.target != null ? var.target : null)
  tags                       = (var.tags != null ? var.tags : [])
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| name | Name of the Floating IP | string | n/a | yes |
| resource\_group\_id | ID of the resource group | string | n/a | no |
| location | Floating IP Zone. Either `location` or `target` input parameters must be provided in the module | string | n/a | no |
| target | Target Interface ID for this Floating IP. Either `location` or `target` input parameters must be provided in the module| string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| floating\_ip\_id | The ID of the Floating IP |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->