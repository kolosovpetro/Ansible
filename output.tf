output "control_node_linux_public_ip" {
  value = {
    ip         = module.control_node.public_ip_address
    sub_domain = local.control_node.sub_domain
    fqdn       = "http://${local.control_node.sub_domain}.${var.dns_prefix}"
  }
}

output "web_server_linux_public_ip" {
  value = {
    ip         = module.linux_servers[local.linux_servers.web_server_linux.indexer].public_ip_address
    sub_domain = local.linux_servers.web_server_linux.sub_domain
    fqdn       = "http://${local.linux_servers.web_server_linux.sub_domain}.${var.dns_prefix}"
  }
}

output "db_server_linux_public_ip" {
  value = {
    ip         = module.linux_servers[local.linux_servers.db_server_linux.indexer].public_ip_address
    sub_domain = local.linux_servers.db_server_linux.sub_domain
    fqdn       = "http://${local.linux_servers.db_server_linux.sub_domain}.${var.dns_prefix}"
  }
}

output "web_server_windows_public_ip" {
  value = {
    ip         = module.windows_servers[local.windows_servers.web_server_windows.indexer].public_ip_address
    sub_domain = local.windows_servers.web_server_windows.sub_domain
    fqdn       = "http://${local.windows_servers.web_server_windows.sub_domain}.${var.dns_prefix}"
  }
}

output "db_server_windows_public_ip" {
  value = {
    ip         = module.windows_servers[local.windows_servers.db_server_windows.indexer].public_ip_address
    sub_domain = local.windows_servers.db_server_windows.sub_domain
    fqdn       = "http://${local.windows_servers.db_server_windows.sub_domain}.${var.dns_prefix}"
  }
}

output "os_user_name" {
  value = var.os_profile_admin_username
}

output "os_user_password" {
  value     = var.os_profile_admin_password
  sensitive = true
}
