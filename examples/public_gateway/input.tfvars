vpc="<name of vpc where the gateways will be provisioned>"
resource_group="<name of resource group>"
zones=[ "<zone within vpc region>"]
prefix="<prefix to add to beginning of names of gateways created>"
floating_ip={
    zone-1="<public_gateway_id_or_ip_address>"
    zone-2=""
    zone-3=""
}
tags=[
    "<tag1>", "<tag2>"
]
public_gateway_names=[
    "<get existing public gateway data by name>"
]