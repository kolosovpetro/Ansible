output "network_security_group_id" {
  value = azurerm_network_security_group.public.id
}

output "subnet_id" {
  value = azurerm_subnet.public.id
}

output "subnet_name" {
  value = azurerm_subnet.public.name
}

output "vnet_name" {
  value = azurerm_virtual_network.public.name
}