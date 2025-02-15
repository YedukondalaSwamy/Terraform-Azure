resource "azurerm_lb_probe" "mylbhp"{
    loadbalancer_id = azurerm_lb.mylb.id
    name = "healthprob"
    protocol = "Tcp"
    port = "3389"
}