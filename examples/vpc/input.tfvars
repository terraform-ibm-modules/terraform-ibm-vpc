########################################################
# VPC configuration
# Copyright 2020 IBM
########################################################

/****************************************************
Example Usage

vpc_tags = ["T1","T2"]


address_prefixes = [
  {
    name     = "prefix-1"
    location = "us-south-1"
    ip_range = "10.0.120.0/18"
  },
]

locations = ["us-south-1", "us-south-2", "us-south-3"]

floating_ip = {
  "id" = "0737_b91457f3-4736-406f-a4fa-9e2be12940b6"
}

floating_ip = {
  "address" = "52.117.15.24"
}

gateway_tags = ["T1","T2"]
******************************************************/

vpc_tags = ["<Tag-1>", "<Tag-2>"]

address_prefixes = [
  {
    name     = "<Name of the vpc Address Prefix>"
    location = "<Address Prefix Zone>"
    ip_range = "<The CIDR block for the address prefix>"
  },
]

locations = ["<zone-1>", "<zone-2>", "<zone-3>"]

floating_ip = {
  "id" = "<floating_ip_id>"
}

gateway_tags = ["<Tag-1>", "<Tag-2>"]