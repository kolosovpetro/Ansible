resource "azurerm_virtual_network" "public" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/24"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "snet_windows_servers" {
  name                 = var.snet_windows_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.public.name
  address_prefixes     = ["10.0.0.0/26"]
}

resource "azurerm_subnet" "snet_linux_servers" {
  name                 = var.snet_linux_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.public.name
  address_prefixes     = ["10.0.0.64/26"]
}