resource "azurerm_public_ip" "agw_pip" {
  name                = var.agwy_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "snet_agwy_frontend" {
  name                 = var.snet_agwy_frontend_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.0.128/26"]
}

resource "azurerm_application_gateway" "main" {
  name                = var.agwy_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = azurerm_subnet.snet_agwy_frontend.id
  }

  frontend_port {
    name = var.frontend_https_port_name
    port = 443
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.agw_pip.id
  }

  backend_address_pool {
    name = var.agwy_backend_pool_name
  }

  backend_http_settings {
    name                  = var.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name             = var.frontend_https_port_name
    protocol                       = "Https"
    ssl_certificate_name           = var.ssl_certificate_name
  }

  ssl_certificate {
    name     = var.ssl_certificate_name
    data     = filebase64(var.ssl_certificate_path)
    password = var.ssl_certificate_password
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = var.http_listener_name
    backend_address_pool_name  = var.agwy_backend_pool_name
    backend_http_settings_name = var.backend_http_settings_name
    priority                   = 1
  }
}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "nic-assoc" {
  for_each                = var.windows_servers
  network_interface_id    = each.value.network_interface_id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = one(azurerm_application_gateway.main.backend_address_pool).id
}