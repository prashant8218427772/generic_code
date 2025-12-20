module "rg" {
    source = "../../child_module/01_resource_group"
    rgs = var.rgs
}
module "vnet" {
    source = "../../child_module/02_vnet+subnet"
    vnets = var.vnets

  
}