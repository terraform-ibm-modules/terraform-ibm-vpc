########################################################
# Network ACL configuration
# Copyright 2020 IBM
########################################################

/****************************************************
Example Usage


rules = [{
  name        = "outbound"
  action      = "allow"
  source      = "0.0.0.0/0"
  destination = "0.0.0.0/0"
  direction   = "outbound"
  },
]

rules = [{
  name        = "inbound"
  action      = "allow"
  source      = "0.0.0.0/0"
  destination = "0.0.0.0/0"
  direction   = "inbound"
  icmp = {
    code = 1
    type = 1
    }
  },
]

rules = [{
  name        = "inbound"
  action      = "allow"
  source      = "0.0.0.0/0"
  destination = "0.0.0.0/0"
  direction   = "inbound"
  tcp = {
    port_min = 22
    port_max = 22
    source_port_min = 1
    source_port_max = 65535
    }
  },
]

rules = [
  {
    name        = "inbound"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    icmp = {
      code = 1
      type = 1
    }
  },
  {
    name        = "inbound2"
    action      = "allow"
    source      = "0.0.0.0/0"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    tcp = {
      port_min = 22
      port_max = 22
      source_port_min = 1
      source_port_max = 65535
    }
  },
]
tags = ["T1","T2"]
******************************************************/


rules = [
  {
    name        = "<rule_name>"
    action      = "<rule_action>"
    source      = "<rule_source>"
    destination = "<rule_destination>"
    direction   = "<rule_direction>"
  },

  {
    name        = "<rule_name>"
    action      = "<rule_action>"
    source      = "<rule_source>"
    destination = "<rule_destination>"
    direction   = "<rule_direction>"

    icmp = {
      code = "<icmp_code>"
      type = "<icmp_type>"
    }
  },

  {
    name        = "<rule_name>"
    action      = "<rule_action>"
    source      = "<rule_source>"
    destination = "<rule_destination>"
    direction   = "<rule_direction>"

    tcp = {
      port_max        = "<tcp_port_max>"
      port_min        = "<tcp_port_min>"
      source_port_max = "<tcp_source_port_max>"
      source_port_min = "<tcp_source_port_min>"
    }
  },

  {
    name        = "<rule_name>"
    action      = "<rule_action>"
    source      = "<rule_source>"
    destination = "<rule_destination>"
    direction   = "<rule_direction>"

    udp = {
      port_max        = "<udp_port_max>"
      port_min        = "<udp_port_min>"
      source_port_max = "<udp_source_port_max>"
      source_port_min = "<udp_source_port_min>"
    }
  },
]
