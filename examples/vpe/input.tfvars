#####################################################
# Virtual Private Endpoint
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage 

//mandatory variables 

target = [{
    resource_type = "provider_infrastructure_service"
    name          = "ibm-dns-server2"
    crn           = ""
  },
]

// optional variables

ips = [{
    id     = "0737-5ab3c18e-6f6c-4a69-8f48-20e3456647b5"
    name   = "test-reserved-ip1"
    subnet = ""
  },
]

reserved_ips = [
  {
    reserved_ip = "0674-5ab3c18e-6f6c-4a69-8f48-20e3456647b5"
  },
]

tags = ["T1","T2"]

******************************************************/


target = [{
  resource_type = "<target_resource_type>"
  name          = "<target_name>"
  crn           = "<target_crn>"
  },
]

// optional variables

ips = [{
  id     = "<ip1_id>"
  name   = "<ip1_name>"
  subnet = "<ip1_subnet_name>"
  },
]

reserved_ips = [
  {
    reserved_ip = "<ip1_id>"
  },
]