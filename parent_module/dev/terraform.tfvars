rgs = {
    rg1= {
        name = "jio"
        location = "central india"
        

    }
}

vnets = {
  vnet1 = {
    name                = "centralindia-vnet"
    resource_group_name = "rg-centralindia"
    location            = "centralindia"

    address_space = [
      "10.0.0.0/16"
    ]

    subnets = {
      frontend = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }

      backend = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

pip = {

  pip1= {
    name = "frontend_pip"
    resource_group_name = "rg-centralindia"
    location = "central india"
   allocation_method = "Static"
  }
}
