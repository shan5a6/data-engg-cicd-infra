resource "azurerm_storage_account" "my_sa" {
  name                     = "${var.app_name}sa${var.environment_suffix}"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "my_sa_containers" {
  for_each  = toset(var.sa_cont_list)
  name                  = each.key
  storage_account_name = azurerm_storage_account.my_sa.name
  container_access_type = "private"
}