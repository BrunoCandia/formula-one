resource "azurerm_container_app" "container_app" {
  container_app_environment_id = azurerm_container_app_environment.app_environment.id
  name = "${var.project_name}-${var.environment}-aca"
  resource_group_name = azurerm_resource_group.main.name
  revision_mode = "Multiple"

  template {
    min_replicas = 1
    max_replicas = 3

    container {
      cpu = 0.25
      image = "mcr.microsoft.com/k8se/quickstart:latest"
      memory = "0.5Gi"
      name = "${var.project_name}-${var.environment}-container"
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled = true
    target_port = 8080

    traffic_weight {
      percentage = 100
      label = "primary"
      latest_revision = true
    }
  }

  tags = {
    environment = var.environment
    src = var.src_key
  }
}