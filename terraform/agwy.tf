resource "azurerm_public_ip" "agw_pip" {
  name                = "pip-agwy-${var.prefix}"
  location            = azurerm_resource_group.public.location
  resource_group_name = azurerm_resource_group.public.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "agwy_frontend_subnet" {
  name                 = "snet-agwy-front-${var.prefix}"
  resource_group_name  = azurerm_resource_group.public.name
  virtual_network_name = module.network.vnet_name
  address_prefixes = ["10.0.3.0/24"]
}

resource "azurerm_application_gateway" "main" {
  name                = "agwy-${var.prefix}"
  resource_group_name = azurerm_resource_group.public.name
  location            = azurerm_resource_group.public.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "ipc-agwy-${var.prefix}"
    subnet_id = azurerm_subnet.agwy_frontend_subnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.agw_pip.id
  }

  backend_address_pool {
    name = local.agwy_backend_pool_name
  }

  backend_http_settings {
    name                  = local.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.http_listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule-${var.prefix}"
    rule_type                  = "Basic"
    http_listener_name         = local.http_listener_name
    backend_address_pool_name  = local.agwy_backend_pool_name
    backend_http_settings_name = local.backend_http_settings_name
    priority                   = 1
  }
}

locals {
  agwy_backend_pool_name         = "backend-pool-${var.prefix}"
  http_listener_name             = "listener-${var.prefix}"
  backend_http_settings_name     = "http-settings-${var.prefix}"
  frontend_ip_configuration_name = "fipc-agwy-${var.prefix}"
  frontend_port_name             = "agwy-port-${var.prefix}"
}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "nic-assoc" {
  for_each                = module.windows_servers
  network_interface_id    = each.value.network_interface_id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = one(azurerm_application_gateway.main.backend_address_pool).id
}