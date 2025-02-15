resource "azurerm_resource_group" "myrg" {
  name     = "resources"
  location = "West Europe"
}

resource "azurerm_service_plan" "myserviceplan" {
  name                = "serviceplan"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  sku_name = "B1"
  os_type = "Windows"
}

resource "azurerm_windows_web_app" "mywebapp" {
  name                = "gopuample"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_service_plan.myserviceplan.location
  service_plan_id     = azurerm_service_plan.myserviceplan.id
  
  site_config {}
  
}

resource "azurerm_windows_web_app_slot" "mywindowswebappslot" {
  name           = "gopuample-slot"
  app_service_id = azurerm_windows_web_app.mywebapp.id

  site_config {}
}

