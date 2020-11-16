# Floating IP Module Example

This example illustrates how to use the [floatingIP](../../modules/floatingIP) module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name                              | Description                                           | Type   | Default | Required |
|-----------------------------------|-------------------------------------------------------|--------|---------|----------|
| resource\_group | Name of the resource group | string | default | no |
| name | Name of the Floating IP | string | n/a | yes |
| location | Floating IP Zone. Either `location` or `target` input parameters must be provided in the module | string | n/a | no |
| target | Target Interface ID for this Floating IP. Either `location` or `target` input parameters must be provided in the module| string | n/a | no |
| tags | List of tags to attach  | list(string) | n/a | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a Floating IP by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.