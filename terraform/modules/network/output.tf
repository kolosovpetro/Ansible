output "network_security_group_id" {
  value = azurerm_network_security_group.public.id
}

output "subnet_windows_servers_id" {
  value = azurerm_subnet.snet_windows_servers.id
}

output "subnet_linux_servers_id" {
  value = azurerm_subnet.snet_linux_servers.id
}
output "subnet_windows_servers_name" {
  value = azurerm_subnet.snet_windows_servers.name
}

output "subnet_linux_servers_name" {
  value = azurerm_subnet.snet_linux_servers.name
}

output "vnet_name" {
  value = azurerm_virtual_network.public.name
}