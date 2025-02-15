resource "azurerm_public_ip" "mypublic" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "mylb" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.mypublic.id
  }
}

resource "azurerm_lb_backend_address_pool" "mylbbackend" {
  loadbalancer_id = azurerm_lb.mylb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "mylbbackendaddpooladd" {
  name                    = azurerm_lb_backend_address_pool.mylbbackend.name
  backend_address_pool_id = azurerm_lb_backend_address_pool.mylbbackend.id
  virtual_network_id      = azurerm_virtual_network.myvnet.id
  ip_address              = azurerm_network_interface.mynic.private_ip_address
}

