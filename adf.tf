resource "azurerm_data_factory" "myadf" {
  name                = "${var.app_name}-adf-${var.environment_suffix}"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  identity {
    type = "SystemAssigned"
  }
  dynamic "github_configuration" {
    for_each = var.environment_suffix == "dev" ? [1] : []
    content {
      account_name    = var.github_configuration.account_name
      branch_name     = var.github_configuration.branch_name
      repository_name = var.github_configuration.repository_name
      root_folder     = var.github_configuration.root_folder
      git_url   =   var.github_configuration.git_url
    }
  }
  depends_on = [
    azurerm_role_assignment.data_factory_contributor
  ]
}

resource "azurerm_role_assignment" "data_factory_contributor" {
  scope                = azurerm_resource_group.myrg.id
  role_definition_name = "Data Factory Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}