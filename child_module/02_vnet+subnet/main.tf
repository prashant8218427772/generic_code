resource "azurerm_virtual_network" "vnet_subnet" {
  for_each = var.vnets

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  address_space  = each.value.address_space
  dns_servers    = each.value.dns_servers
  bgp_community  = each.value.bgp_community
  edge_zone      = each.value.edge_zone
  flow_timeout_in_minutes = each.value.flow_timeout_in_minutes
  private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
  tags = each.value.tags

  ########################
  # IP Address Pool
  ########################
  dynamic "ip_address_pool" {
    for_each = each.value.ip_address_pool
    content {
      id                     = ip_address_pool.value.id
      number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
    }
  }

  ########################
  # DDoS Protection Plan
  ########################
  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  ########################
  # Encryption
  ########################
  dynamic "encryption" {
    for_each = each.value.encryption
    content {
      enforcement = encryption.value.enforcement
    }
  }

  ########################
  # Subnets
  ########################
  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name                                      = subnet.value.name
      address_prefixes                          = subnet.value.address_prefixes
      security_group                            = subnet.value.security_group
      route_table_id                            = subnet.value.route_table_id
      service_endpoints                         = subnet.value.service_endpoints
      service_endpoint_policy_ids               = subnet.value.service_endpoint_policy_ids
      default_outbound_access_enabled           = subnet.value.default_outbound_access_enabled
      private_endpoint_network_policies         = subnet.value.private_endpoint_network_policies
      private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled

        
      ########################
      # Delegation
      ########################
      dynamic "delegation" {
        for_each = subnet.value.delegation
        content {
          name = delegation.value.name

          service_delegation {
            name    = delegation.value.service_delegation.name
            actions = delegation.value.service_delegation.actions
          }
        }
      }
    }
  }
}
