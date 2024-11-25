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
  backend_pool_name              = "backend-pool-dev"
  http_listener_name             = "http-listener-dev"
  routing_rule_name              = "https-rule-dev"
}