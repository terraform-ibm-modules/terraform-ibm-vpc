########################################################
# VPN Gateway configuration
# Copyright 2020 IBM
########################################################

/****************************************************
Example Usage

tags = ["T1","T2"]

connections = [
  {
    name          = "connection1"
    peer_address  = "52.116.196.227"
    preshared_key = "VPNDemoPassword"
    local_cidrs   = ["10.240.0.0/28"]
    peer_cidrs    = ["10.240.64.0/28"]
  },
]

******************************************************/

tags = ["<Tag-1>", "<Tag-2>"]

connections = [
  {
    name          = "<name>"
    peer_address  = "<peer_address>"
    preshared_key = "<preshared_key>"
    local_cidrs   = "<local_cidrs_list>"
    peer_cidrs    = "<peer_cidrs_list>"
  },
]
