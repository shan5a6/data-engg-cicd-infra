resource "azurerm_resource_group" "myrg" {
  name     = "${var.app_name}-rg-${var.environment_suffix}"
  location = var.rg_region
}
