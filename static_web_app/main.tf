resource "azurerm_resource_group" "myrg" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_static_web_app" "myswp" {
  name                = "example"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
}

