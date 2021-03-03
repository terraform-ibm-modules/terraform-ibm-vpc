# Public Gateway Module Example

This example illustrates how to use the `public_gateway` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the Public Gateway | string | n/a | yes |
| vpc | Name of the VPC | string | n/a | yes |
| location | Zone of the Public Gateway  | string | n/a | yes |
| floating\_ip | Floating IP `id` or `address` that you want to assign to the public gateway | map | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


NOTE: We can configure the list of tags, floating_ip to be attached to a the Public Gateway by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.