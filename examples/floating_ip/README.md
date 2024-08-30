# Floating IP Module Example

This example illustrates how to use the `floatingIP` module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name           | Description                                                                                   | Type         | Default | Required
-------------- | --------------------------------------------------------------------------------------------- | ------------ | ------- | --------
name           | Name of the Floating IP                                                                       | string       |         | true
resource_group | Resource group name                                                                           | string       | null    | 
zone           | Floating IP Zone. This conflicts with 'target'. Give only either of one                       | string       | null    | 
target         | Target Interface ID for this Floating IP. This conflicts with 'zone'. Give only either of one | string       | null    | 
tags           | List of Tags for the Floating IP                                                              | list(string) | null    | 

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

NOTE: We can configure the list of tags to be attached to a Floating IP by entering respective details in input.tfvars.

## Usage

terraform apply -var-file="input.tfvars"

## Note

For all optional fields, default values (Eg: `null`) are given in varaible.tf file. User can configure the same by overwriting with appropriate values.