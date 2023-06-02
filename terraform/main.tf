resource "azurerm_resource_group" "public" {
  location = var.resource_group_location
  name     = "${var.resource_group_name}-${var.prefix}"
}

module "network" {
  source                  = "./modules/network"
  nsg_name                = "${var.nsg_name}-${var.prefix}"
  resource_group_location = azurerm_resource_group.public.location
  resource_group_name     = azurerm_resource_group.public.name
  subnet_name             = "${var.subnet_name}-${var.prefix}"
  vnet_name               = "${var.vnet_name}-${var.prefix}"
}

module "control_node" {
  source                            = "./modules/ubuntu-vm-password-auth"
  ip_configuration_name             = var.ip_configuration_name
  network_interface_name            = "${var.network_interface_name}-control-node"
  network_security_group_id         = module.network.network_security_group_id
  os_profile_admin_password         = var.os_profile_admin_password
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "${var.os_profile_computer_name}ControlNode"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "${var.storage_os_disk_name}controlnode"
  subnet_id                         = module.network.subnet_id
  vm_name                           = "${var.vm_name}-control-node"
  vm_public_ip_name                 = "${var.vm_public_ip_name}ControlNode"
  vm_size                           = var.vm_size

  depends_on = [
    module.network.network_security_group_id,
    module.network.subnet_id
  ]
}

module "node_one" {
  source                            = "./modules/ubuntu-vm-password-auth"
  ip_configuration_name             = var.ip_configuration_name
  network_interface_name            = "${var.network_interface_name}-node-one"
  network_security_group_id         = module.network.network_security_group_id
  os_profile_admin_password         = var.os_profile_admin_password
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "${var.os_profile_computer_name}NodeOne"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "${var.storage_os_disk_name}nodeone"
  subnet_id                         = module.network.subnet_id
  vm_name                           = "${var.vm_name}-node-one"
  vm_public_ip_name                 = "${var.vm_public_ip_name}NodeOne"
  vm_size                           = var.vm_size

  depends_on = [
    module.network.network_security_group_id,
    module.network.subnet_id
  ]
}

module "node_two" {
  source                            = "./modules/ubuntu-vm-password-auth"
  ip_configuration_name             = var.ip_configuration_name
  network_interface_name            = "${var.network_interface_name}-node-two"
  network_security_group_id         = module.network.network_security_group_id
  os_profile_admin_password         = var.os_profile_admin_password
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "${var.os_profile_computer_name}NodeTwo"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "${var.storage_os_disk_name}nodetwo"
  subnet_id                         = module.network.subnet_id
  vm_name                           = "${var.vm_name}-node-two"
  vm_public_ip_name                 = "${var.vm_public_ip_name}NodeTwo"
  vm_size                           = var.vm_size

  depends_on = [
    module.network.network_security_group_id,
    module.network.subnet_id
  ]
}

module "node_three" {
  source                            = "./modules/ubuntu-vm-password-auth"
  ip_configuration_name             = var.ip_configuration_name
  network_interface_name            = "${var.network_interface_name}-node-three"
  network_security_group_id         = module.network.network_security_group_id
  os_profile_admin_password         = var.os_profile_admin_password
  os_profile_admin_username         = var.os_profile_admin_username
  os_profile_computer_name          = "${var.os_profile_computer_name}NodeThree"
  resource_group_location           = azurerm_resource_group.public.location
  resource_group_name               = azurerm_resource_group.public.name
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  storage_os_disk_caching           = var.storage_os_disk_caching
  storage_os_disk_create_option     = var.storage_os_disk_create_option
  storage_os_disk_managed_disk_type = var.storage_os_disk_managed_disk_type
  storage_os_disk_name              = "${var.storage_os_disk_name}nodethree"
  subnet_id                         = module.network.subnet_id
  vm_name                           = "${var.vm_name}-node-three"
  vm_public_ip_name                 = "${var.vm_public_ip_name}NodeThree"
  vm_size                           = var.vm_size

  depends_on = [
    module.network.network_security_group_id,
    module.network.subnet_id
  ]
}