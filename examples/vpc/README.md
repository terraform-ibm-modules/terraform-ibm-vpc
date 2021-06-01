# Module VPC

This example illustrates how to use the `vpc` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| create\_vpc | True to create new VPC. False if VPC is already existing and subnets, gateways are to be added to it | bool | n/a | yes |
| vpc\_name | Name of the vpc. Required only if Creating a new VPC | string | n/a | no |
| classic\_access | Indicates whether this VPC should be connected to Classic Infrastructure. | bool | false | no |
| default\_address\_prefix | Indicates whether a default address prefix should be automatically created for each zone in this VPC.  | string | auto | no |
| default\_network\_acl\_name | Name of the Default ACL of the VPC | string | n/a | no |
| default\_security\_group\_name | Name of the Default Security Group of the VPC | string | n/a | no |
| default\_routing\_table\_name | Name of the Default Routing Table of the VPC  | string | n/a | no |
| vpc\_tags | List of tags to attach to the VPC | list(string) | n/a | no |
| address\_prefixes | List of Prefixes for the vpc | list(object) | n/a | no |
| locations | zones per region | list(string) | n/a | no |
| subnet\_name | Name(or Prefix) of the Subnet(s). Required only while Creating a new subnet(s) | string | n/a | no |
| number\_of\_addresses | Number of IPV4 Addresses. Required only while Creating a new subnet(s) | number | n/a | no |
| vpc | ID of the Existing VPC to which subnets, gateways are to be attached | string | n/a | no |
| create\_gateway | True to create new Public Gateway | bool | false | no |
| public\_gateway\_name | Name(or prefix) of the Public Gateway(s). Required only if Creating a new Public Gateway | string | n/a | no |
| floating\_ip | Floating IP `id` or `address` that you want to assign to the public gateway | map | n/a | no |
| gateway\_tags | List of Tags for the gateway | list(string) | n/a | no |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a VPC by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.