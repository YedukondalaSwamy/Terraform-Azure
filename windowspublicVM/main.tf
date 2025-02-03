# Create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = "terraformRG"
  location = "eastus"
}
