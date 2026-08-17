resource "azurerm_container_registry" "acr" {
  location = azurerm_resource_group.main.location
  name = "${replace(var.project_name, "-", "")}${var.environment}acr"
  resource_group_name = azurerm_resource_group.main.name
  sku = "Standard"
  admin_enabled = true
  public_network_access_enabled = true

  tags = {
    environment = var.environment
    src = var.src_key
  }
}