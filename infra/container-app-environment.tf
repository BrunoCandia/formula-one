resource "azurerm_container_app_environment" "app_environment" {
  location = azurerm_resource_group.main.location
  name = "${var.project_name}-${var.environment}-acae"
  resource_group_name = azurerm_resource_group.main.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  tags = {
    environment = var.environment
    src = var.src_key
  }
}