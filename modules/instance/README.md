# Instance Module Example

This module is used to create an Instance

## Example Usage
```
data ibm_is_vpc vpc {
  name = var.vpc
}

data ibm_resource_group resource_group {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module instance {
  source = "terraform-ibm-modules/vpc/ibm//modules/instance"

  instances                 = var.instances
  name                      = var.name
  vpc_id                    = data.ibm_is_vpc.vpc.id
  resource_group_id         = data.ibm_resource_group.resource_group.id
  subnet                    = data.ibm_is_subnet.subnet.id
  zone                      = data.ibm_is_subnet.subnet.zone
  image_id                  = var.image
  profile                   = var.profile
  ssh_keys                  = var.ssh_keys
  user_data                 = var.user_data
  boot_volume               = var.boot_volume
  network_interfaces        = var.network_interfaces
  data_volumes              = var.data_volumes
  tags                      = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name                      | Type                                                                                                                   | Description                                                                                                                   | Default                                           | Required
------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- | -
name                      | string                                                                                                                 | Name of the Instance                                                                                                          | n/a                                               | true
vpc_id                    | string                                                                                                                 | VPC ID                                                                                                                        | n/a                                               | true
zone                      | string                                                                                                                 | Instance zone                                                                                                                 | n/a                                               | true
subnet_id                 | string                                                                                                                 | ID of the subnet where the primary network interface will be attached. The zone of the subnet must match the `zone` variable. | n/a                                               | true
image_id                  | string                                                                                                                 | Image ID for the instance                                                                                                     | n/a                                               | true
profile                   | string                                                                                                                 | Profile type for the Instance. Use `ibmcloud is instance-profiles` for a list of instance profiles                            | n/a                                               | true
ssh_key_ids               | list(string)                                                                                                           | List of ssh key IDs for the instance                                                                                          | n/a                                               | true
instances                 | number                                                                                                                 | number of Instances                                                                                                           | 1                                                 |
resource_group_id         | string                                                                                                                 | Resource group ID                                                                                                             | null                                              |
primary_network_interface | object({ interface_name = string primary_ipv4_address = string })                                                      | Optional. Object detailing primary network interface primary_network_interface that are to be attached to the instance.       | { interface_name = "" primary_ipv4_address = "" } |
security_group_ids        | list(string)                                                                                                           | Optional. A list of security group ids to attach the primary network interface.                                               | []                                                |
user_data                 | string                                                                                                                 | User Data for the instance                                                                                                    | null                                              |
data_volumes              | list(string)                                                                                                           | List of volume ids that are to be attached to the instance                                                                    | []                                                |
tags                      | list(string)                                                                                                           | List of Tags for the Instance                                                                                                 | null                                              |
network_interfaces        | list(object({ subnet = string interface_name = string security_groups = list(string) primary_ipv4_address = string })) | List of network_interfaces that are to be attached to the instance                                                            | []                                                |
boot_volume               | list(object({ name = string encryption = string }))                                                                    | List of boot volume that are to be attached to the instance   

## Outputs

Name                       | Description                                    | Value
-------------------------- | ---------------------------------------------- | ---------------------------------------------------------------------------
id                         | The ID of the Instances                        | ibm_is_instance.instances.*.id
primary_network_interfaces | The primary_network_interface of the Instances | [for ins in ibm_is_instance.instances : ins.primary_network_interface.*.id]
zone                       | Zone where the Instances are provisioned       | var.zone

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->