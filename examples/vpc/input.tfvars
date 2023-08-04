##############################################################################
# Example Usage
##############################################################################

create_vpc=true
region="us-south"
vpc_name="example-vpc"
prefix="example"
resource_group="example-rg"
classic_access=false
auto_prefix_management=false
default_network_acl_name="example-acl"
default_security_group_name="example-sg"
default_routing_table_name="example-routing-table"
tags=["example-1", "example-2"]
address_prefixes={
  zone-1 = [
    "10.10.10.0/24"
  ],
  zone-2 = [
    "10.40.10.0/24"
  ],
  zone-3 = [
    "10.70.10.0/24"
  ]
}
create_subnets_for_address_prefixes=true
create_public_gateway=false
acl_id="<acl_id>"

##############################################################################