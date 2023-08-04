########################################################
# Instance Template configuration
# Copyright 2020 IBM
########################################################

/****************************************************
Example Usage

//mandatory variables

primary_network_interface = [{
  allow_ip_spoofing    = false
  subnet               = "0737-7a911fcf-737d-4a85-b3b1-0184c6939eb6"
  interface_name       = ""
  primary_ipv4_address = ""
  security_groups      = ["r006-3c175148-9e94-4300-aa2d-f0a8aca1a9a4"]
  },
]

ssh_keys = ["r006-61f07322-ec1d-4e8d-97d8-3002d46e9d0d"]


// optional variables

network_interfaces = [{
  allow_ip_spoofing    = false
  subnet               = "0727-6d96ba0c-e0da-434d-84ef-b57f0dc1ebff"
  interface_name       = ""
  primary_ipv4_address = ""
  security_groups      = []
  },
]

boot_volume = [{
       name = "bootvol1"
       encryption  = "crn:v1:bluemix:public:kms:us-south:a/a178d11ec2f24159bb21acc368e57cea:24a825b6-697c-4081-bcd7-32632de7a73d:key:58746ed1-22e9-4831-9259-ca40aa885615"
   },
]

volumes_attachments = [{
    name                             = "vol_att1"
    volume                           = string
    encryption                       = string
    delete_volume_on_instance_delete = true
    volume_prototype = list(object({
      profile        = string
      capacity       = number
      iops           = number
      encryption_key = string
  },
]

******************************************************/


primary_network_interface = [{
  allow_ip_spoofing    = false
  subnet               = "<subnet_id>"
  interface_name       = "<primary_network_interface name>"
  security_groups      = ["<security_group_id>"]
  primary_ipv4_address = "<primary_ipv4_address>"
  },
]

ssh_keys = ["<sshKeyID>"]