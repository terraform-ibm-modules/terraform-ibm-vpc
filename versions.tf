terraform {
  required_version = ">= 1.3.0"
  required_providers {
    # Use "greater than or equal to" range in modules
    # tflint-ignore: terraform_unused_required_providers
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.63.0, <2.0.0"
    }
  }
}
