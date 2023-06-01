output "network_security_group_id" {
  value = azurerm_network_security_group.public.id
}

output "subnet_id" {
  value = azurerm_subnet.internal.id
}