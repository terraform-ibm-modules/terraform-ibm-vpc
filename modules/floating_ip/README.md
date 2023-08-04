# Floating IP Module Example

This module is used to create a Floating IP

## Example Usage
```

data ibm_resource_group resource_group {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module fip {
  source = "terraform-ibm-modules/vpc/ibm//modules/floating_ip"

  name              = var.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  zone              = var.location
  tags              = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name              | Type         | Description                                                                                                             | Default | Required
----------------- | ------------ | ----------------------------------------------------------------------------------------------------------------------- | ------- | --------
name              | string       | Name of the Floating IP                                                                                                 |         | true
zone              | string       | Floating IP Zone. Either `zone` or `target` input parameters must be provided in the module.                            |         | true
resource_group_id | string       | Resource group ID                                                                                                       | null    |
target            | string       | Target Interface ID for this Floating IP. Either `location` or `target` input parameters must be provided in the module | null    |
tags              | list(string) | List of Tags for the Floating IP                                                                                        | null    |

## Outputs

Name    | Description                | Value
------- | -------------------------- | --------------------------------------------------------------------------------------------------------------------------
id      | The ID of the Floating IP  | ibm_is_floating_ip.fip.id
address | The Floating IP address    | ibm_is_floating_ip.fip.address
detail  | Floating IP address detail | {<br>id = ibm_is_floating_ip.fip.id<br>address = ibm_is_floating_ip.fip.address<br>zone = ibm_is_floating_ip.fip.zone<br>}
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->