variable "rgs"{
    description = "rg ki value"
    type = map(object({
      name = string
      location = string
      managed_by = optional(string,null)
      
      

    }))
}
