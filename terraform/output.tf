output "control_node_linux_public_ip" {
  value = module.control_node.public_ip_address
}

output "web_server_linux_public_ip" {
  value = module.linux_servers[local.machines.web_server_linux.indexer].public_ip_address
}

output "db_server_linux_public_ip" {
  value = module.linux_servers[local.machines.db_server_linux.indexer].public_ip_address
}

output "os_user_name" {
  value = var.os_profile_admin_username
}