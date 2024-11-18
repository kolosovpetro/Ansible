resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = local.rg_name
}

module "network" {
  source                  = "./modules/network"
  nsg_name                = local.nsg_name
  resource_group_location = azurerm_resource_group.public.location
  resource_group_name     = azurerm_resource_group.public.name
  subnet_name             = local.subnet_name
  vnet_name               = local.vnet_name
}

module "control_node" {
  source                            = "./modules/ubuntu-vm-public-key-auth"
  ip_configuration_name             = local.control_node.ip_configuration_name
  network_interface_name            = local.control_node.network_interface_name
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = local.control_node.os_profile_computer_name
  public_ip_name                    = local.control_node.public_ip_name
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = local.control_node.storage_os_disk_name
  subnet_name                       = module.network.subnet_name
  vm_name                           = local.control_node.vm_name
  vm_size                           = var.vm_size
  subnet_id                         = module.network.subnet_id
  network_security_group_id         = module.network.network_security_group_id
  os_profile_admin_public_key_path  = var.os_profile_admin_public_key_path
}

module "linux_servers" {
  for_each                          = local.linux_servers
  source                            = "./modules/ubuntu-vm-password-auth"
  ip_configuration_name             = each.value.ip_configuration_name
  network_interface_name            = each.value.network_interface_name
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = each.value.os_profile_computer_name
  os_profile_admin_password         = var.os_profile_admin_password
  public_ip_name                    = each.value.public_ip_name
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = each.value.storage_os_disk_name
  vm_name                           = each.value.vm_name
  vm_size                           = var.vm_size
  subnet_id                         = module.network.subnet_id
  network_security_group_id         = module.network.network_security_group_id
}

module "windows_servers" {
  for_each                    = local.windows_servers
  source                      = "./modules/windows-vm"
  ip_configuration_name       = each.value.ip_configuration_name
  network_interface_name      = each.value.network_interface_name
  network_security_group_id   = module.network.network_security_group_id
  os_profile_admin_password   = var.os_profile_admin_password
  os_profile_admin_username   = var.os_profile_admin_username
  os_profile_computer_name    = each.value.os_profile_computer_name
  public_ip_name              = each.value.public_ip_name
  resource_group_location     = azurerm_resource_group.public.location
  resource_group_name         = azurerm_resource_group.public.name
  storage_os_disk_name        = each.value.storage_os_disk_name
  subnet_id                   = module.network.subnet_id
  vm_name                     = each.value.vm_name
  #image_resource_group_name   = each.value.image_resource_group_name
  storage_image_reference_sku = each.value.storage_image_reference_sku
  vm_size                     = var.vm_size
}

module "storage" {
  source                      = "./modules/storage"
  storage_account_name        = "storvmwin${var.prefix}"
  storage_account_replication = var.storage_account_replication
  storage_account_tier        = var.storage_account_tier
  storage_container_name      = "contvmwin${var.prefix}"
  storage_location            = azurerm_resource_group.public.location
  storage_resource_group_name = azurerm_resource_group.public.name

  depends_on = [
    azurerm_resource_group.public
  ]
}

module "custom_script_extension" {
  for_each                              = local.windows_servers
  source                                = "./modules/custom-script-extension"
  custom_script_extension_absolute_path = "E:\\RiderProjects\\09_ANSIBLE\\ansible-control-node\\terraform\\scripts\\Configure-Ansible-Host.ps1"
  custom_script_extension_file_name     = "Configure-Ansible-Host.ps1"
  extension_name                        = "ConfigureAnsibleHost"
  storage_account_name                  = module.storage.storage_account_name
  storage_container_name                = module.storage.storage_container_name
  virtual_machine_id                    = module.windows_servers[each.key].id

  depends_on = [
    module.storage,
    module.windows_servers
  ]
}

module "control_node_install_ansible_extension" {
  source                                = "./modules/linux-custom-script-extension"
  custom_script_extension_absolute_path = "E:\\RiderProjects\\09_ANSIBLE\\ansible-control-node\\scripts\\install_ansible.sh"
  custom_script_extension_file_name     = "install_ansible.sh"
  extension_name                        = "InstallAnsible"
  storage_account_name                  = module.storage.storage_account_name
  storage_container_name                = module.storage.storage_container_name
  virtual_machine_id                    = module.control_node.id

  depends_on = [
    module.storage,
    module.windows_servers
  ]
}