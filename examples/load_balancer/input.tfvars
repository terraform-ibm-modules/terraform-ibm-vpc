#####################################################
# VPC Load Balancer Configuration
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage


pool_name                = "test-pool"
pool_algorithm           = "round_robin"
pool_protocol            = "http"
pool_health_delay        = 60
pool_health_retries      = 5
pool_health_timeout      = 30
pool_health_type         = "http"
pool_proxy_protocol      = "v1"
pool_health_monitor_port = 8080
pool_members             = [ "127.0.0.1" ]
pool_member_port         = 8080

listener_port     = 9086
listener_protocol = "http"
lb_listener_policies = [{
  name                    = "testlis1pol1"
  action                  = "redirect"
  priority                = 2
  target_id               = null
  target_http_status_code = 302
  target_url              = "https://www.google.com"
  rules = [
    {
      name      = "testlis1pol1rule1"
      condition = "equals"
      type      = "header"
      field     = "MY-APP-HEADER"
      value     = "newval"
    },
    {
      name      = "testlis1pol1rule2"
      condition = "equals"
      type      = "header"
      field     = "MY-APP-HEADER"
      value     = "New-value"
    },
  ]
}]

******************************************************/


subnet_ids = ["<subnet_id>"]

security_group_ids = ["<security_group_id>"]

tags = ["T1", "T2"]
