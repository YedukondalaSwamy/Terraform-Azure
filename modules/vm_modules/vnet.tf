resource "azurerm_network_security_group" "nsg" {
  name                = var.my_nsg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "network_interface_security_group_association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  subnet_id                 = azurerm_subnet.sub.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.my_vnet
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = var.my_addressspace
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

  resource "azurerm_subnet" "sub"{
    name             = var.my_subnet
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.my_addressprefixes
  }

  resource "azurerm_network_interface" "nic" {
  name                = "mynic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name



  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sub.id
    private_ip_address_allocation = "Dynamic"
  }




#   tags = {
#     environment = "Production"
#   }
}