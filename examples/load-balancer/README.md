# Load balancer example

<!-- BEGIN SCHEMATICS DEPLOY HOOK -->
<p>
  <a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=vpc-load-balancer-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-vpc/tree/main/examples/load-balancer">
    <img src="https://img.shields.io/badge/Deploy%20with%20IBM%20Cloud%20Schematics-0f62fe?style=flat&logo=ibm&logoColor=white&labelColor=0f62fe" alt="Deploy with IBM Cloud Schematics">
  </a><br>
  ℹ️ Ctrl/Cmd+Click or right-click on the Schematics deploy button to open in a new tab.
</p>
<!-- END SCHEMATICS DEPLOY HOOK -->

An example that demonstrates mTLS support for a VPC Application Load Balancer. It creates the following infrastructure:
- A resource group, if one is not passed in.
- A new VPC instance with subnets across three zones.
- A self-signed CA certificate and a server certificate (signed by the CA), generated locally with the `tls` provider.
- Both certificates imported into an existing Secrets Manager instance.
- A public Application Load Balancer with:
  - A pool configured with `proxy_protocol`, `client_authentication` (mTLS client cert), and `server_authentication` (backend cert verification).
  - An HTTPS listener with `client_authentication` (mTLS — requires clients to present a certificate signed by the CA).
