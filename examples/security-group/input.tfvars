#####################################################
# Security Group Parameters
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage

security_group_rules = [
  {
    name      = "rule1"
    direction = "inbound"
  },

  {
    name       = "rule2"
    direction  = "inbound"
    remote     = ""
    ip_version = ""
    tcp = {
      port_min = 30000
      port_max = 32767
    }
  },

  {
    name      = "rule3"
    direction = "outbound"
    udp = {
      port_min = null
      port_max = null
    }
  },

  {
    name      = "rule4"
    direction = "outbound"
    icmp = {
      code = null
      type = null
    }
  },
]

******************************************************/


security_group_rules = [
  {
    name       = "<rule1_name>"
    direction  = "inbound"
    remote     = ""
    ip_version = ""
    tcp = {
      port_min = "<port_min>"
      port_max = "<port_max>"
    }
  },
]
