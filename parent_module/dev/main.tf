module "rg" {
    source = "../../child_module/01_resource_group"
    rgs = var.rgs
}