output "control_node_linux_ip" {
  value = module.control_node.public_ip_address
}

output "control_node_linux_sub_domain" {
  value = local.control_node.sub_domain
}

output "control_node_linux_fqdn" {
  value = "http://${local.control_node.sub_domain}.${var.dns_prefix}"
}

output "web_server_linux_ip" {
  value = module.linux_servers[local.linux_servers.web_server_linux.indexer].public_ip_address
}

output "web_server_linux_sub_domain" {
  value = local.linux_servers.web_server_linux.sub_domain
}

output "web_server_linux_fqdn" {
  value = "http://${local.linux_servers.web_server_linux.sub_domain}.${var.dns_prefix}"
}

output "db_server_linux_ip" {
  value = module.linux_servers[local.linux_servers.db_server_linux.indexer].public_ip_address
}

output "db_server_linux_sub_domain" {
  value = local.linux_servers.db_server_linux.sub_domain
}

output "db_server_linux_fqdn" {
  value = "http://${local.linux_servers.db_server_linux.sub_domain}.${var.dns_prefix}"
}

output "web_server_windows_ip" {
  value = module.windows_servers[local.windows_servers.web_server_windows.indexer].public_ip_address
}

output "web_server_windows_sub_domain" {
  value = local.windows_servers.web_server_windows.sub_domain
}

output "web_server_windows_fqdn" {
  value = "http://${local.windows_servers.web_server_windows.sub_domain}.${var.dns_prefix}"
}

output "db_server_windows_ip" {
  value = module.windows_servers[local.windows_servers.db_server_windows.indexer].public_ip_address
}

output "db_server_windows_sub_domain" {
  value = local.windows_servers.db_server_windows.sub_domain
}

output "db_server_windows_fqdn" {
  value = "http://${local.windows_servers.db_server_windows.sub_domain}.${var.dns_prefix}"
}

output "os_user_name" {
  value = var.os_profile_admin_username
}

output "os_user_password" {
  value     = var.os_profile_admin_password
  sensitive = true
}
