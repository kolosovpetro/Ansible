output "control_node_linux_public_ip" {
  value = {
    ip         = module.control_node.public_ip_address
    sub_domain = "ansible.control.node"
  }
}

output "web_server_linux_public_ip" {
  value = {
    ip         = module.linux_servers[local.linux_servers.web_server_linux.indexer].public_ip_address
    sub_domain = "ansible.webserver"
  }
}

output "db_server_linux_public_ip" {
  value = {
    ip         = module.linux_servers[local.linux_servers.db_server_linux.indexer].public_ip_address
    sub_domain = "ansible.dbserver"
  }
}

output "web_server_windows_public_ip" {
  value = {
    ip         = module.windows_servers[local.windows_servers.web_server_windows.indexer].public_ip_address
    sub_domain = "ansible.win.webserver"
  }
}

output "db_server_windows_public_ip" {
  value = {
    ip         = module.windows_servers[local.windows_servers.db_server_windows.indexer].public_ip_address
    sub_domain = "ansible.win.dbserver"
  }
}

output "application_gateway_ip" {
  value = module.application_gateway.agwy_public_ip_address
}

output "application_gateway_url" {
  value = "https://agwy.test.razumovsky.me"
}

output "os_user_name" {
  value = var.os_profile_admin_username
}