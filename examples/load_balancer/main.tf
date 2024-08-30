#####################################################
# Load Balanncer Configuration Example
# Copyright 2020 IBM
#####################################################

provider ibm {
}

data ibm_resource_group resource_group {
  name = var.resource_group != null ? var.resource_group : "default"
}

module load_balancer {
  source = "terraform-ibm-modules/vpc/ibm//modules/load_balancer"

  create_load_balancer           = var.create_load_balancer
  name                           = var.name
  subnet_ids                     = var.subnet_ids
  use_public_load_balancer       = var.use_public_load_balancer
  security_group_ids             = var.security_group_ids
  logging                        = var.logging
  resource_group_id              = data.ibm_resource_group.resource_group.id
  tags                           = var.tags
  pool_name                      = var.pool_name
  pool_algorithm                 = var.pool_algorithm
  pool_protocol                  = var.pool_protocol
  pool_health_delay              = var.pool_health_delay
  pool_health_retries            = var.pool_health_retries
  pool_health_timeout            = var.pool_health_timeout
  pool_health_type               = var.pool_health_type
  pool_health_monitor_url        = var.pool_health_monitor_url
  pool_health_monitor_port       = var.pool_health_monitor_port
  pool_session_persistence_type  = var.pool_session_persistence_type
  pool_members                   = var.pool_members
  pool_member_weights            = var.pool_member_weights
  pool_member_port               = var.pool_member_port
  listener_port                  = var.listener_port
  listener_protocol              = var.listener_protocol
  listener_certificate_instance  = var.listener_certificate_instance
  listener_accept_proxy_protocol = var.listener_accept_proxy_protocol
  listener_connection_limit      = var.listener_connection_limit
  listener_policies              = var.listener_policies
}
