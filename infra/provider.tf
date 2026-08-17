terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        # version = "5.0.0" // Use dotnet_version = "10.0"
        version = "4.46.0" // Use dotnet_version = "9.0"
        # version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}