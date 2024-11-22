data "cloudflare_zone" "razumovsky_me_zone" {
  name = "razumovsky.me"
}

resource "cloudflare_record" "control_node_dns" {
  zone_id = data.cloudflare_zone.razumovsky_me_zone.id
  name    = local.control_node.dns_name
  content = module.control_node.public_ip_address
  type    = "A"
  proxied = false

  depends_on = [
    module.control_node
  ]
}

resource "cloudflare_record" "linux_servers_dns" {
  for_each = local.linux_servers
  zone_id  = data.cloudflare_zone.razumovsky_me_zone.id
  name     = each.value.dns_name
  content  = module.linux_servers[each.key].public_ip_address
  type     = "A"
  proxied  = false

  depends_on = [
    module.linux_servers
  ]
}

resource "cloudflare_record" "windows_servers_dns" {
  for_each = local.windows_servers
  zone_id  = data.cloudflare_zone.razumovsky_me_zone.id
  name     = each.value.dns_name
  content  = module.windows_servers[each.key].public_ip_address
  type     = "A"
  proxied  = false

  depends_on = [
    module.windows_servers
  ]
}

resource "cloudflare_record" "agwy_dns" {
  zone_id = data.cloudflare_zone.razumovsky_me_zone.id
  name    = "agwy.test"
  content = module.application_gateway.agwy_public_ip_address
  type    = "A"
  proxied = false
}