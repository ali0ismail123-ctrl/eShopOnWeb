terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "acr_name" {
  type = string
}

resource "azurerm_resource_group" "dev" {
  name     = "rg-eshoponweb-dev-uksouth"
  location = "UK South"
}

resource "azurerm_container_registry" "dev" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.dev.name
  location            = azurerm_resource_group.dev.location
  sku                 = "Basic"
  admin_enabled       = false
}

output "acr_login_server" {
  value = azurerm_container_registry.dev.login_server
}