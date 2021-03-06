#####################################################
# VPC Load Balancer Configuration
# Copyright 2020 IBM
#####################################################

/****************************************************
Example Usage

lb_listeners = [{
  port                  = 9086
  protocol              = "http"
}]

lb_listener_policies = [{
  name                    = "testlis1pol1"
  listener_port           = "9086"
  action                  = "redirect"
  priority                = 2
  target_http_status_code = 302
  target_url              = "https://www.google.com"
  rules = {
    condition = "contains"
    type      = "header"
    field     = "1"
    value     = "2"
  }
}]

lb_listener_policy_rules = [{
  name                 = "testlis1pol1rule1"
  listener_port        = "9086"
  listener_policy_name = "testlis1pol1"
  condition = "equals"
  type      = "header"
  field     = "MY-APP-HEADER"
  value     = "UpdateVal"
}]

******************************************************/


subnets = ["<subnet_id>"]

security_groups = ["<security_group_id>"]

tags = ["T1", "T2"]

lb_pools = [{
  name                            = string
  algorithm                       = string
  protocol                        = string
  health_delay                    = number
  health_retries                  = number
  health_timeout                  = number
  health_type                     = string
  health_monitor_url              = string
  health_monitor_port             = number
  session_persistence_type        = string
  session_persistence_cookie_name = string
}]

lb_pool_members = [{
  lb_pool_name   = string
  port           = number
  target_address = string
  target_id      = string
  weight         = number
}]

lb_listeners = [{
  port                  = number
  protocol              = string
  default_pool          = string
  certificate_instance  = string
  connection_limit      = number
  accept_proxy_protocol = bool
}]

lb_listener_policies = [{
  name                    = string
  listener_name           = string
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
}]

lb_listener_policy_rules = [{
  name                 = string
  listener_name        = string
  listener_policy_name = string
  condition            = string
  type                 = string
  field                = string
  value                = string
}]