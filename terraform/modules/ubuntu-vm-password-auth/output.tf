output "public_ip_address" {
  value = azurerm_public_ip.public.ip_address
}

output "public_ip_id" {
  value = azurerm_public_ip.public.id
}

output "username" {
  value = var.os_profile_admin_username
}
