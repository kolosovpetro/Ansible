output "public_ip_address" {
  value = azurerm_public_ip.public.ip_address
}

output "id" {
  value = azurerm_virtual_machine.public.id
}