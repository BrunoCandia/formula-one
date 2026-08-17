resource "azurerm_mssql_server" "sql_server" {
  location = azurerm_resource_group.main.location
  name = "${var.project_name}-${var.environment}-sqlserver"
  resource_group_name = azurerm_resource_group.main.name
  version = "12.0"
  administrator_login          = "formulaoneadmin"
  administrator_login_password = var.sql_server_pass

  tags = {
    environment = var.environment
    src = var.src_key
  }
}

resource "azurerm_mssql_database" "formula_one_db" {
  name = "${var.project_name}-${var.environment}-Formulaone"
  server_id = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 10
  sku_name     = "S1"
  zone_redundant = false

  tags = {
    environment = var.environment
    src = var.src_key
  }
}

resource "azurerm_mssql_firewall_rule" "rule" {
  end_ip_address = "0.0.0.0"
  start_ip_address = "0.0.0.0"
  name = "all_azure"
  server_id = azurerm_mssql_server.sql_server.id
}