resource "azurerm_public_ip" "ip" {
  name                = "PublicIp"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
}