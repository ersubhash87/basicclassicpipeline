terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "7e364832-3b31-48b1-a39b-99461e0af1f0"
}

resource "azurerm_resource_group" "rg_test" {
  name     = "rg-pipe"
  location = "centralindia"
}

resource "azurerm_storage_account" "st_account" {
  name                     = "storageacct1234"
  resource_group_name      = azurerm_resource_group.rg_test.name
  location                 = azurerm_resource_group.rg_test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}