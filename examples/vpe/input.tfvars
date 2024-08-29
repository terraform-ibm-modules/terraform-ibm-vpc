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
  name   = "test-reserved-ip1"
  subnet = "0727-3cda7a24-27e6-4198-8148-f00164d09991"
  },
]


reserved_ips = [
  {
    reserved_ip = "0737-e28c9f3d-9d6a-436f-8478-bbea28f7ae26"
  },
]


 ## ADD the below local block in main.tf if subnet_ids are to be used in creation of Endpoint ips
locals {
  subnet_ids = ["0727-80680487-c6cb-4685-bb0c-8024f89fbcd8", "0737-a8611186-8567-4ca7-ba6e-a532b7834333"]
  ips = [
    for count in range(2) : {
      subnet = local.subnet_ids[count]
      name   = "newip-${count}"
    }
  ]
}

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
