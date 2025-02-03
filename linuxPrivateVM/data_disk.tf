
  resource "azurerm_managed_disk" "disk" {
  name                 = "data"
  location             = azurerm_resource_group.myrg.location
  resource_group_name  = azurerm_resource_group.myrg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

  resource "azurerm_virtual_machine_data_disk_attachment" "vmdisk" {
  managed_disk_id    = azurerm_managed_disk.disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.myvm.id
  lun                = "10"
  caching            = "ReadWrite"
  }