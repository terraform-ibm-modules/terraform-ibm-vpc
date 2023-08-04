# Load Balancer Module Example

This module is used to create Load Balancer Resources

## Example Usage
```
data ibm_resource_group resource_group {
  name = (var.resource_group != null ? var.resource_group : "default")
}

module load-balancer {
  source = "terraform-ibm-modules/vpc/ibm//modules/load_balancer"

  create_load_balancer           = var.create_load_balancer
  name                           = var.name
  subnet_ids                     = var.subnet_ids
  use_public_load_balancer       = var.use_public_load_balancer
  security_group_ids             = var.security_group_ids
  logging                        = var.logging
  resource_group_id              = var.resource_group_id
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
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

Name                           | Description                                                                                                                                          | Type                                                                                                                                                                                                                                             | Default     | Required
------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- | --------
create_load_balancer           | True to create new Load Balancer. False if Load Balancer is already existing and Load Balancer pools/listeners are to be added                       | bool                                                                                                                                                                                                                                             | true        | yes
name                           | Name of the Load Balancer                                                                                                                            | string                                                                                                                                                                                                                                           | null        | yes
subnet_ids                     | List of subnet IDs for Load Balancer                                                                                                                 | list(string)                                                                                                                                                                                                                                     | []          | yes
use_public_load_balancer       | Use public Load Balancer. If false, a private load balancer will be created.                                                                         | bool                                                                                                                                                                                                                                             | true        | yes
security_group_ids             | Load Balancer security groups ID list.                                                                                                               | list(string)                                                                                                                                                                                                                                     | null        |
logging                        | Logging of Load Balancer.                                                                                                                            | bool                                                                                                                                                                                                                                             | null        |
resource_group_id              | Resource group ID                                                                                                                                    | string                                                                                                                                                                                                                                           | null        |
tags                           | List of Tags for the Load Balancer                                                                                                                   | list(string)                                                                                                                                                                                                                                     | null        | 
pool_name                      | Name for the Load Balncer Pool where instances will be added.                                                                                        | string                                                                                                                                                                                                                                           |             | yes
pool_algorithm                 | Algorithm to be used for Load Balancer Pool. Can be `round_robin`, `weighted_round_robin`, or `least_connections`.                                   | string                                                                                                                                                                                                                                           | round_robin | 
pool_protocol                  | Protocol for Load Balancer Pool. Can ve `http`, `https`, or `tcp`.                                                                                   | string                                                                                                                                                                                                                                           | http        | 
pool_health_delay              | The Load Balancer Pool health check interval in seconds. Interval must be greater than timeout value.                                                | number                                                                                                                                                                                                                                           | 15          | 
pool_health_retries            | The Load Balancer Pool health check max retries.                                                                                                     | number                                                                                                                                                                                                                                           | 10          | 
pool_health_timeout            | The Load Balancer Pool health check timeout in seconds.                                                                                              | number                                                                                                                                                                                                                                           | 10          | 
pool_health_type               | Protocol for Load Balancer Health Check. Can ve `http`, `https`, or `tcp`.                                                                           | string                                                                                                                                                                                                                                           | http        | 
pool_health_monitor_url        | Optional. Health Check URL for Load Balancer Pool. This option is only applicable with the `http` health check type.                                 | string                                                                                                                                                                                                                                           | null        | 
pool_health_monitor_port       | Optional. Load Balancer Pool health check port number.                                                                                               | number                                                                                                                                                                                                                                           | null        | 
pool_session_persistence_type  | Optional. Load Balancer Pool Session Persistence type.                                                                                               | string                                                                                                                                                                                                                                           | null        | 
pool_proxy_protocol            | Optional. The proxy protocol setting for the pool that is supported by the load balancers in the application family. Valid values are disabled, v1, and v2. Default value is disabled. | string                                                                                                                                                                                                         | disabled    | 
pool_members                   | List of load balancer pool members. These can be either an IP address or the GUID of a Virtual Server instance                                       | list(string)                                                                                                                                                                                                                                     |             | yes
pool_member_weights            | Optional. A list of weights for each of the pool members. This can only be used when the Load Balancer Pool algorithm is `weighted_round_robin`      | list(number)                                                                                                                                                                                                                                     | []          | 
pool_member_port               | The port number of the application running in the server.                                                                                            | number                                                                                                                                                                                                                                           |             | yes
listener_port                  | Listener port number.                                                                                                                                | number                                                                                                                                                                                                                                           |             | yes
listener_protocol              | Protocol for Load Balancer Listener. Can ve `http`, `https`, or `tcp`.                                                                               | string                                                                                                                                                                                                                                           | http        | 
listener_certificate_instance  | The CRN of the certificate instance, it is applicable(mandatory) only to https protocol.                                                             | string                                                                                                                                                                                                                                           | null        | 
listener_accept_proxy_protocol | If set to true, listener forwards proxy protocol information that are supported by load balancers in the application family. Default value is false. | bool                                                                                                                                                                                                                                             | false       | 
listener_connection_limit      | The connection limit of the listener. Valid range is 1 to 15000. Network load balancer do not support connection_limit argument.                     | number                                                                                                                                                                                                                                           | null        | 
listener_policies              | List of policies to apply to the load balancer listener and rules for each policy                                                                    | list(object({ name = string action = string priority = number target_id = string target_http_status_code = number target_url = string rules = list(object({ name = string condition = string type = string field = string value = string })) })) | []          |


## Outputs

Name                     | Description
------------------------ | ----------------------------------------------
id                       | The ID of the Load balancer
pool_id                  | ID of Load balancer Pool
pool_member_ids          | All IDs of Load balancer Pool Members
listener_id              | ID of Load Balancer Listener
listener_policy_ids      | All IDs of Load balancer Listener Policies
listener_policy_rule_ids | All IDs of Load balancer Listener Policy Rules


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->