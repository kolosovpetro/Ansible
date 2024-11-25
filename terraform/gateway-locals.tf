locals {
  https_port_name                = "front-port-443"
  http_port_name                 = "front-port-80"
  frontend_ip_configuration_name = "front-ip-config-${var.prefix}"
  gateway_ip_configuration_name  = "gateway-ip-config-${var.prefix}"
  http_settings_name             = "backend-http-settings-${var.prefix}"
  ssl_certificate_name           = "razumovsky.me.pfx"
  domain_name                    = "razumovsky.me"
  custom_cloudflare_dev_fqdn     = "agwy-vm-dev.${local.domain_name}"
  custom_cloudflare_qa_fqdn      = "agwy-vm-qa.${local.domain_name}"
  backend_pool_dev               = "backend-pool-dev"
  backend_pool_qa                = "backend-pool-qa"
  https_listener_dev             = "https-listener-dev"
  https_listener_qa              = "https-listener-qa"

  http_listener_dev     = "http-listener-dev"
  http_listener_qa      = "http-listener-qa"
  routing_rule_dev_name = "https-rule-dev"
  routing_rule_qa_name  = "https-rule-qa"

  frontend_ports = [
    {
      name = local.http_port_name
      port = 80
    },
    {
      name = local.https_port_name
      port = 443
    }
  ]

  backend_pools = [
    {
      name = local.backend_pool_dev
    },
    {
      name = local.backend_pool_qa
    }
  ]

  https_listeners = [
    {
      name      = local.https_listener_dev
      host_name = local.custom_cloudflare_dev_fqdn
    },
    {
      name      = local.https_listener_qa
      host_name = local.custom_cloudflare_qa_fqdn
    }
  ]

  http_listeners = [
    {
      name      = local.http_listener_dev
      host_name = local.custom_cloudflare_dev_fqdn
    },
    {
      name      = local.http_listener_qa
      host_name = local.custom_cloudflare_qa_fqdn
    }
  ]

  https_routing_rules = [
    {
      name                      = local.routing_rule_dev_name
      http_listener_name        = local.https_listener_dev
      backend_address_pool_name = local.backend_pool_dev
      priority                  = 10
    },
    {
      name                      = local.routing_rule_qa_name
      http_listener_name        = local.https_listener_qa
      backend_address_pool_name = local.backend_pool_qa
      priority                  = 20
    }
  ]
}