resource "azurerm_lb_rule" "mylbrules" {
  loadbalancer_id                = azurerm_lb.mylb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.mylbbackend.id]
  probe_id = azurerm_lb_probe.mylbhp.id
  disable_outbound_snat          = true
}
