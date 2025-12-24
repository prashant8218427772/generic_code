module "rg" {
  source = "../../child_module/01_resource_group"
  rgs    = var.rgs
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../child_module/02_vnet+subnet"
  vnets      = var.vnets


}
module "public_ip" {
  depends_on = [module.rg]
  source     = "../../child_module/03_azurerm_public_ip"
  pip        = var.pip


}
module "nsg" {
  source = "../../child_module/04_azurerm_nsg"
  nsg    = var.nsgs

}