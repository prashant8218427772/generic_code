variable "vnets" {
  description = "Virtual Network configuration map"

  type = map(object({

    # --------------------
    # REQUIRED
    # --------------------
    name                = string
    resource_group_name = string
    location            = string

    # Exactly one should be used (user responsibility)
    address_space = optional(list(string), [])
    dns_servers   = optional(list(string), [])

    # --------------------
    # OPTIONAL – VNET LEVEL
    # --------------------
    bgp_community                   = optional(string, null)
    edge_zone                       = optional(string, null)
    flow_timeout_in_minutes         = optional(number, null)
    private_endpoint_vnet_policies  = optional(string, "Disabled")
    tags                            = optional(map(string), {})

    # --------------------
    # OPTIONAL BLOCKS
    # --------------------
    ip_address_pool = optional(list(object({
      id                     = string
      number_of_ip_addresses = string
    })), [])

    ddos_protection_plan = optional(list(object({
      id     = string
      enable = bool
    })), [])

    encryption = optional(list(object({
      enforcement = string
    })), [])

    # --------------------
    # SUBNETS
    # --------------------
    subnets = optional(map(object({

      name             = string
      address_prefixes = list(string)

      security_group      = optional(string, null)
      route_table_id      = optional(string, null)
      service_endpoints   = optional(list(string), [])
      service_endpoint_policy_ids = optional(list(string), [])

      default_outbound_access_enabled = optional(bool, true)

      private_endpoint_network_policies = optional(string, "Disabled")
        

      private_link_service_network_policies_enabled = optional(bool, true)
        
     delegation = optional(list(object({
        name = string
        service_delegation = object({
          name    = string
          actions = optional(list(string), [])
        })
      })), [])

    })), {})

  }))
}
