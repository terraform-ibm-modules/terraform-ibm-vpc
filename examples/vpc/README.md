# Module VPC

This example illustrates how to use the `vpc` module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the vpc | string | n/a | yes |
| classic\_access | Indicates whether this VPC should be connected to Classic Infrastructure. | bool | false | no |
| default\_prefix\_management | Indicates whether a default address prefix should be automatically created for each zone in this VPC.  | string | auto | no |
| tags | List of tags to attach  | list(string) | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a VPC by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.