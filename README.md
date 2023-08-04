# IBM VPC Terraform Module

## Module archived

:spider_web: This repo is no longer maintained and is archived. Use the [IBM Cloud Provider](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs) resources directly to create VPC resources, or use one of following maintained public modules if you consume the module from GitHub: 
- [terraform-ibm-landing-zone-vpc](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone-vpc)
- [terraform-ibm-landing-zone-vsi](https://github.com/terraform-ibm-modules/terraform-ibm-landing-zone-vsi)
- [terraform-ibm-security-group](https://github.com/terraform-ibm-modules/terraform-ibm-security-group)
- [terraform-ibm-client-to-site-vpn](https://github.com/terraform-ibm-modules/terraform-ibm-client-to-site-vpn)
- [terraform-ibm-vpe-gateway](https://github.com/terraform-ibm-modules/terraform-ibm-vpe-gateway)

## Changes if you use the Hashicorp registry

:exclamation: **Important:**  This module will be deleted from the Hashicorp registry on 1 September 2023. 

If you consume the from the Hashicorp registry, use one of these instead:
- [landing-zone-vpc](https://registry.terraform.io/modules/terraform-ibm-modules/landing-zone-vpc/ibm/latest)
- [landing-zone-vsi](https://registry.terraform.io/modules/terraform-ibm-modules/landing-zone-vsi/ibm/latest)
- [security-group](https://registry.terraform.io/modules/terraform-ibm-modules/security-group/ibm/latest)
- [client-to-site-vpn](https://registry.terraform.io/modules/terraform-ibm-modules/client-to-site-vpn/ibm/latest)
- [vpe-gateway](https://registry.terraform.io/modules/terraform-ibm-modules/vpe-gateway/ibm/latest)

---

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
