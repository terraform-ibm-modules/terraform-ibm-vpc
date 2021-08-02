# IBM VPC Terraform Module

This is a collection of modules that make it easier to provision VPC Resources on IBM Cloud Platform:

* vpc
* vpc-address-prefix
* subnet
* security-group
* floatingIP
* instance
* instance-template
* network-acl
* public-gateway
* volume
* vpn-gateway
* vpn-gateway-connection
* load-balancer
* vpe
* ssh-key
* image

## Compatibility

This module is meant for use with Terraform 0.13.

## Usage

Full examples are in the [examples](./examples/) folder.

## Requirements

### Terraform plugins

- [Terraform](https://www.terraform.io/downloads.html) 0.13
- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

## Install

### Terraform

Be sure you have the correct Terraform version (0.13), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

### Terraform plugins

Be sure you have the compiled plugins on $HOME/.terraform.d/plugins/

- [terraform-provider-ibm](https://github.com/IBM-Cloud/terraform-provider-ibm)

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