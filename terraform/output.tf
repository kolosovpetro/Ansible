output "control_node_linux_public_ip" {
  value = module.control_node.public_ip_address
}

output "web_server_linux_public_ip" {
  value = module.linux_servers[local.linux_servers.web_server_linux.indexer].public_ip_address
}

output "db_server_linux_public_ip" {
  value = module.linux_servers[local.linux_servers.db_server_linux.indexer].public_ip_address
}

output "web_server_windows_public_ip" {
  value = module.windows_servers[local.windows_servers.web_server_windows.indexer].public_ip_address
}

output "db_server_windows_public_ip" {
  value = module.windows_servers[local.windows_servers.db_server_windows.indexer].public_ip_address
}

output "os_user_name" {
  value = var.os_profile_admin_username
}