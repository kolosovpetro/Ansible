resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = local.rg_name
}

locals {
  rg_name = "${var.resource_group_name}-${var.prefix}"

  nsg_name    = "${var.nsg_name}-${var.prefix}"
  subnet_name = "${var.subnet_name}-${var.prefix}"
  vnet_name   = "${var.vnet_name}-${var.prefix}"

  app_server_ip_configuration_name    = "app-server-${var.ip_configuration_name}"
  app_server_network_interface_name   = "app-server-${var.network_interface_name}"
  app_server_public_ip_name           = "app-server-${var.vm_public_ip_name}"
  app_server_os_profile_computer_name = "app-server"
  app_server_storage_os_disk_name     = "app-server-${var.storage_os_disk_name}"
  app_server_vm_name                  = "app-server-${var.vm_name}"

  web_server_ip_configuration_name    = "web-server-${var.ip_configuration_name}"
  web_server_network_interface_name   = "web-server-${var.network_interface_name}"
  web_server_public_ip_name           = "web-server-${var.vm_public_ip_name}"
  web_server_os_profile_computer_name = "web-server"
  web_server_storage_os_disk_name     = "web-server-${var.storage_os_disk_name}"
  web_server_vm_name                  = "web-server-${var.vm_name}"

  db_server_ip_configuration_name    = "db-server-${var.ip_configuration_name}"
  db_server_network_interface_name   = "db-server-${var.network_interface_name}"
  db_server_public_ip_name           = "db-server-${var.vm_public_ip_name}"
  db_server_os_profile_computer_name = "db-server"
  db_server_storage_os_disk_name     = "db-server-${var.storage_os_disk_name}"
  db_server_vm_name                  = "db-server-${var.vm_name}"
}

module "network" {
  source                  = "./modules/network"
  nsg_name                = local.nsg_name
  resource_group_location = azurerm_resource_group.public.location
  resource_group_name     = azurerm_resource_group.public.name
  subnet_name             = local.subnet_name
  vnet_name               = local.vnet_name
}

module "app_server" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = local.app_server_ip_configuration_name
  network_interface_name            = local.app_server_network_interface_name
  nsg_name                          = var.nsg_name
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = local.app_server_os_profile_computer_name
  public_ip_name                    = local.app_server_public_ip_name
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = local.app_server_storage_os_disk_name
  subnet_name                       = module.network.subnet_name
  vm_name                           = local.app_server_vm_name
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name
  network_security_group_id         = module.network.network_security_group_id
  subnet_id                         = module.network.subnet_id

  depends_on = [
    module.network.network_security_group_id,
    module.network.subnet_id,
    module.network.network_security_group_id,
    module.network.subnet_id
  ]
}

module "web_server" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = local.web_server_ip_configuration_name
  network_interface_name            = local.web_server_network_interface_name
  nsg_name                          = var.nsg_name
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = local.web_server_os_profile_computer_name
  public_ip_name                    = local.web_server_public_ip_name
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = local.web_server_storage_os_disk_name
  subnet_name                       = module.network.subnet_name
  vm_name                           = local.web_server_vm_name
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name
  network_security_group_id         = module.network.network_security_group_id
  subnet_id                         = module.network.subnet_id

  depends_on = [
    module.network.network_security_group_id,
    module.network.subnet_id,
    module.network.network_security_group_id,
    module.network.subnet_id
  ]
}

module "db_server" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = local.db_server_ip_configuration_name
  network_interface_name            = local.db_server_network_interface_name
  nsg_name                          = var.nsg_name
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = local.db_server_os_profile_computer_name
  public_ip_name                    = local.db_server_public_ip_name
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = local.db_server_storage_os_disk_name
  subnet_name                       = module.network.subnet_name
  vm_name                           = local.db_server_vm_name
  vm_size                           = var.vm_size
  vnet_name                         = module.network.vnet_name
  network_security_group_id         = module.network.network_security_group_id
  subnet_id                         = module.network.subnet_id

  depends_on = [
    module.network.network_security_group_id,
    module.network.subnet_id,
    module.network.network_security_group_id,
    module.network.subnet_id
  ]
}