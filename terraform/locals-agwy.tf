locals {
  app_services = {
    dev = {
      name         = local.app_service_dev_name
      location     = "northeurope"
      default_fqdn = local.app_service_dev_default_fqdn
    }
    qa = {
      name         = local.app_service_qa_name
      location     = "northeurope"
      default_fqdn = local.app_service_qa_default_fqdn
    }
  }

  app_service_dev_name         = "ase-dev-${var.prefix}"
  app_service_dev_default_fqdn = "ase-dev-${var.prefix}.azurewebsites.net"
  app_service_qa_name          = "ase-qa-${var.prefix}"
  app_service_qa_default_fqdn  = "ase-qa-${var.prefix}.azurewebsites.net"

  frontend_https_port_name       = "front-port-443"
  frontend_http_port_name        = "front-port-80"
  frontend_ip_configuration_name = "front-ip-config-${var.prefix}"
  backend_https_settings_name    = "backend-https-settings-${var.prefix}"
  backend_http_settings_name     = "backend-http-settings-${var.prefix}"
  ssl_certificate_name           = "razumovsky.me.pfx"
  domain_name                    = "razumovsky.me"
  custom_cloudflare_dev_fqdn     = "agwy-dev.${local.domain_name}"
  custom_cloudflare_qa_fqdn      = "agwy-qa.${local.domain_name}"

  https_routing_settings = [
    {
      environment               = "dev"
      https_rule_name           = "https-rule-dev"
      rule_type                 = "Basic"
      appservice_default_fqdn   = local.app_service_dev_default_fqdn
      backend_address_pool_name = "backend-pool-dev"
      priority                  = 10
      https_listener_name       = local.https_listeners[0].https_listener_name
    },
    {
      environment               = "qa"
      https_rule_name           = "https-rule-qa"
      rule_type                 = "Basic"
      backend_address_pool_name = "backend-pool-qa"
      priority                  = 20
      appservice_default_fqdn   = local.app_service_qa_default_fqdn
      https_listener_name       = local.https_listeners[1].https_listener_name
    }
  ]

  https_listeners = [
    {
      https_listener_name    = "https-listener-dev"
      custom_cloudflare_fqdn = local.custom_cloudflare_dev_fqdn
    },
    {
      https_listener_name    = "https-listener-qa"
      custom_cloudflare_fqdn = local.custom_cloudflare_qa_fqdn
    }
  ]

  http_listeners = [
    {
      http_listener_name     = "http-listener-dev"
      custom_cloudflare_fqdn = local.custom_cloudflare_dev_fqdn
    },
    {
      http_listener_name     = "http-listener-qa"
      custom_cloudflare_fqdn = local.custom_cloudflare_qa_fqdn
    }
  ]

  http_routing_rules = [
    {
      http_rule_name              = "http-to-https-redirect-dev"
      http_listener_name          = local.http_listeners[0].http_listener_name
      rule_type                   = "Basic"
      priority                    = 30
      redirect_configuration_name = "redirect-http-to-https-config-dev"
      target_listener_name        = local.https_listeners[0].https_listener_name
    },
    {
      http_rule_name              = "http-to-https-redirect-qa"
      http_listener_name          = local.http_listeners[1].http_listener_name
      rule_type                   = "Basic"
      priority                    = 40
      redirect_configuration_name = "redirect-http-to-https-config-qa"
      target_listener_name        = local.https_listeners[1].https_listener_name
    }
  ]
}