resource "azurerm_resource_group" "main" {
  name = "${var.project_name}-${var.environment}-rg"
  location = "${var.location}"

  tags = {
    environment = var.environment
    src = var.src_key
  }
}