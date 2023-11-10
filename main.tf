terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "renaudtouillet"
    workspaces {
      name = "remotestate"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg_azure_training"
  location = "switzerlandnorth"
}

resource "azurerm_storage_account" "storage01" {

  name                          = "satesttf001"
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  resource_group_name           = azurerm_resource_group.rg.name
  public_network_access_enabled = false

}