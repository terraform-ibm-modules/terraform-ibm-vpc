#####################################################
# VPC Load Balancer Configuration
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage

lb_pools = [{
  name           = "test-pool"
  lb             = "addfd-gg4r4-12345"
  algorithm      = "round_robin"
  protocol       = "http"
  health_delay   = 60
  health_retries = 5
  health_timeout = 30
  health_type    = "http"
  proxy_protocol = "v1"
  lb_pool_members = [
    {
      port           = 8080
      target_address = "127.0.0.1"
      target_id      = null
      weight         = null
    },
  ]
}]

lb_listeners = [{
  port     = 9086
  protocol = "http"
  lb_listener_policies = [{
    name                    = "testlis1pol1"
    action                  = "redirect"
    priority                = 2
    target_id               = null
    target_http_status_code = 302
    target_url              = "https://www.google.com"
    rules = {
      condition = "contains"
      type      = "header"
      field     = "1"
      value     = "2"
    }
    lb_listener_policy_rules = [
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
}]

******************************************************/


subnets = ["<subnet_id>"]

security_groups = ["<security_group_id>"]

tags = ["T1", "T2"]

lb_pools = [{
  name                                = string
  algorithm                           = string
  protocol                            = string
  health_delay                        = number
  health_retries                      = number
  health_timeout                      = number
  health_type                         = string
  health_monitor_url                  = string
  health_monitor_port                 = number
  session_persistence_type            = string
  session_persistence_app_cookie_name = string
  proxy_protocol                      = string
  lb_pool_members = [{
    port           = number
    target_address = string
    target_id      = string
    weight         = number
  }]
}]

lb_listeners = [{
  port                  = number
  protocol              = string
  default_pool          = string
  certificate_instance  = string
  connection_limit      = number
  accept_proxy_protocol = bool
  lb_listener_policies = [{
    name                    = string
    action                  = string
    priority                = number
    target_id               = string
    target_http_status_code = number
    target_url              = string
    rules = object({
      condition = string
      type      = string
      field     = string
      value     = string
    })
    lb_listener_policy_rules = [{
      name      = string
      condition = string
      type      = string
      field     = string
      value     = string
    }]
  }]
}]