vpc="<vpc_id>"
region="<ibm_vpc_region>"
prefix="<subnet_name_prefixes>"
subnets={
    zone-1=["<cir_blocks or total_ipv4_address"]
    zone-2=["<cir_blocks or total_ipv4_address"]
    zone-3=["<cir_blocks or total_ipv4_address"]
}
create_subnet_prefixes=true
public_gateways={
    zone-1="public_gateway_id>"
    zone-2="public_gateway_id>"
    zone-3="public_gateway_id>"
}
routing_table_id="<routing_table_id>"
acl_id="<acl_id>"
subnet_names=["<existing_subnet_name>"]