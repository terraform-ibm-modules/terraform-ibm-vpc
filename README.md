# IBM VPC Terraform Module

This is a collection of modules that make it easier to provision VPC Resources on IBM Cloud Platform:

* vpc
* vpc_address_prefix
* subnet
* security_group
* floatingIP
* instance
* network_acl
* public_gateway
* volume
* vpn_gateway
* vpn_gateway_connection
* load_balancer
* vpe
* ssh_key
* image

## Compatibility

This module is meant for use with Terraform 0.13.

## Usage

Full examples are in the examples folder.

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.13
## Install

### Terraform

Be sure you have the correct Terraform version (0.13), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

## How to input varaible values through a file

To review the plan for the configuration defined (no resources actually provisioned)

`terraform plan -var-file=./input.tfvars`

To execute and start building the configuration defined in the plan (provisions resources)

`terraform apply -var-file=./input.tfvars`

To destroy the VPC and all related resources

`terraform destroy -var-file=./input.tfvars`

All optional parameters by default will be set to null in respective example's varaible.tf file. If user wants to configure any optional paramter he has overwrite the default value.

## Note

All optional fields should be given value `null` in respective resource varaible.tf file. User can configure the same by overwriting with appropriate values.
