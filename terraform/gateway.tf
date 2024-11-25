resource "azurerm_application_gateway" "app_gateway" {
  name                = "agwy-${var.prefix}"
  resource_group_name = azurerm_resource_group.public.name
  location            = azurerm_resource_group.public.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = local.gateway_ip_configuration_name
    subnet_id = azurerm_subnet.gateway_subnet.id
  }

  dynamic "frontend_port" {
    for_each = local.frontend_ports
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.gateway_public_ip.id
  }

  dynamic "backend_address_pool" {
    for_each = local.backend_pools
    content {
      name = backend_address_pool.value.name
    }
  }

  backend_http_settings {
    name                  = local.http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  dynamic "http_listener" {
    for_each = local.https_listeners
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = local.frontend_ip_configuration_name
      frontend_port_name             = local.https_port_name
      protocol                       = "Https"
      ssl_certificate_name           = local.ssl_certificate_name
      host_name                      = http_listener.value.host_name
    }
  }

  dynamic "http_listener" {
    for_each = local.http_listeners
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = local.frontend_ip_configuration_name
      frontend_port_name             = local.http_port_name
      protocol                       = "Http"
      host_name                      = http_listener.value.host_name
    }
  }

  ssl_certificate {
    name     = var.ssl_certificate_name
    data = filebase64(var.ssl_certificate_path)
    password = var.ssl_certificate_password
  }

  dynamic "request_routing_rule" {
    for_each = local.https_routing_rules
    content {
      name                       = request_routing_rule.value.name
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name = local.http_settings_name
      priority                   = request_routing_rule.value.priority
    }
  }
}

data "azurerm_application_gateway" "example" {
  name                = azurerm_application_gateway.app_gateway.name
  resource_group_name = azurerm_resource_group.public.name
}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "nic-assoc" {
  for_each                = module.windows_servers
  network_interface_id    = each.value.network_interface_id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = data.azurerm_application_gateway.example.backend_address_pool[0].id
}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "qa_backend_pool" {
  for_each                = module.linux_servers
  network_interface_id    = each.value.network_interface_id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = data.azurerm_application_gateway.example.backend_address_pool[1].id
}