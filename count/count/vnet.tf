resource "azurerm_network_security_group" "nsg" {
  count = 4
  name                = "mynsg-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "RDP"
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
  count = 4
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg[count.index].id
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  count = 4
  subnet_id                 = azurerm_subnet.sub[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg[count.index].id
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

  resource "azurerm_subnet" "sub"{
    count = 4
    name             = "default-${count.index}"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.${count.index}.0/24"]
  }

  resource "azurerm_network_interface" "nic" {
  count = 4
  name                = "my-nic-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name



  ip_configuration {
    name                          = "internal-${count.index}"
    subnet_id                     = azurerm_subnet.sub[count.index].id
    private_ip_address_allocation = "Dynamic"
  }




#   tags = {
#     environment = "Production"
#   }
}