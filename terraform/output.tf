output "app_server_public_ip" {
  value = module.app_server.public_ip_address
}

output "web_server_public_ip" {
  value = module.web_server.public_ip_address
}

output "db_server_public_ip" {
  value = module.db_server.public_ip_address
}