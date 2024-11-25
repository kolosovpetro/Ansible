resource "azurerm_public_ip" "gateway_public_ip" {
  name                = "pip-agw-${var.prefix}"
  location            = azurerm_resource_group.public.location
  resource_group_name = azurerm_resource_group.public.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "gateway_subnet" {
  name                 = "subnet-agw-${var.prefix}"
  resource_group_name  = azurerm_resource_group.public.name
  virtual_network_name = module.network.vnet_name
  address_prefixes = ["10.0.0.128/26"]
}