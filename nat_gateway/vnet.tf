resource "azurerm_virtual_network" "vnet" {
  name                = "network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "sub" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_nat_gateway" "nat" {
  name                = "NatGateWay"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_nat_gateway_association" "snnga" {
  subnet_id      = azurerm_subnet.sub.id
  nat_gateway_id = azurerm_nat_gateway.nat.id
}