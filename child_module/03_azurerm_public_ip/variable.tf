variable "pip" {
  description = "ye pip ka code hai"
  type = map(object({
  name                    = string
  resource_group_name     = string
  location                = string
  allocation_method       = string
  zones                   = optional(list(string), [])
  ddos_protection_mode    = optional(string, null)
  ddos_protection_plan_id = optional(string, null)
  domain_name_label       = optional(string, null)
  domain_name_label_scope = optional(string, null)
  edge_zone               = optional(string, null)
  idle_timeout_in_minutes = optional(number, 4)
  ip_tags                 = optional(map(string), {})
  ip_version              = optional(string, "IPv4")
  public_ip_prefix_id     = optional(string, null)
  reverse_fqdn            = optional(string, null)
  sku                     = optional(string, "Standard")
  sku_tier                = optional(string, "Global")
  tags                    = optional(map(string), {})


  }))



}