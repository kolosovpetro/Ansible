locals {
  resource_group_name = "${var.resource_group_name}-${var.prefix}"
  network_settings = {
    nsg_name                = "nsg-ansible-${var.prefix}"
    vnet_name               = "vnet-ansible-${var.prefix}"
    snet_agwy_frontend_name = "snet-agwy-frontend-${var.prefix}"
    snet_linux_name         = "snet-linux-servers-${var.prefix}"
    snet_windows_name       = "snet-windows-servers-${var.prefix}"
  }

  control_node = {
    indexer                  = "control_node"
    ip_configuration_name    = "ipc-control-node-${var.prefix}"
    network_interface_name   = "nic-control-node-${var.prefix}"
    public_ip_name           = "pip-control-node-${var.prefix}"
    os_profile_computer_name = "control-node"
    storage_os_disk_name     = "os-disk-control-node-${var.prefix}"
    vm_name                  = "vm-control-node-${var.prefix}"
    sub_domain               = "ansible-control-node"
    private_ip_address       = "10.0.0.100"
  }

  linux_servers = {
    web_server_linux = {
      indexer                  = "web_server_linux"
      ip_configuration_name    = "ipc-web-server-${var.prefix}"
      network_interface_name   = "nic-web-server-${var.prefix}"
      public_ip_name           = "pip-web-server-${var.prefix}"
      os_profile_computer_name = "web-server"
      storage_os_disk_name     = "os-disk-web-server-${var.prefix}"
      vm_name                  = "vm-web-server-${var.prefix}"
      sub_domain               = "ansible-webserver"
      private_ip_address       = "10.0.0.101"
    }
    db_server_linux = {
      indexer                  = "db_server_linux"
      ip_configuration_name    = "ipc-db-server-${var.prefix}"
      network_interface_name   = "nic-db-server-${var.prefix}"
      public_ip_name           = "pip-db-server-${var.prefix}"
      os_profile_computer_name = "db-server"
      storage_os_disk_name     = "os-disk-db-server-${var.prefix}"
      vm_name                  = "vm-db-server-${var.prefix}"
      sub_domain               = "ansible-dbserver"
      private_ip_address       = "10.0.0.102"
    }
  }

  windows_servers = {
    web_server_windows = {
      indexer                     = "web_server_windows"
      ip_configuration_name       = "ipc-web-server-windows-${var.prefix}"
      network_interface_name      = "nic-web-server-windows-${var.prefix}"
      public_ip_name              = "pip-web-server-windows-${var.prefix}"
      os_profile_computer_name    = "web-server-win"
      storage_os_disk_name        = "os-disk-web-server-windows-${var.prefix}"
      vm_name                     = "vm-web-server-win-${var.prefix}"
      storage_image_reference_sku = "2022-Datacenter"
      sub_domain                  = "ansible-win-webserver"
      private_ip_address          = "10.0.0.10"
    }
    db_server_windows = {
      indexer                     = "db_server_windows"
      ip_configuration_name       = "ipc-db-server-windows-${var.prefix}"
      network_interface_name      = "nic-db-server-windows-${var.prefix}"
      public_ip_name              = "pip-db-server-windows-${var.prefix}"
      os_profile_computer_name    = "db-server-win"
      storage_os_disk_name        = "os-disk-db-server-windows-${var.prefix}"
      vm_name                     = "vm-db-server-win-${var.prefix}"
      storage_image_reference_sku = "2022-Datacenter"
      image_resource_group_name   = "rg-packer-win-2019"
      sub_domain                  = "ansible-win-dbserver"
      private_ip_address          = "10.0.0.11"
    }
  }

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore",
    "Purge"
  ]

  certificate_permissions = [
    "Backup",
    "Create",
    "Delete",
    "DeleteIssuers",
    "Get",
    "GetIssuers",
    "Import",
    "List",
    "ListIssuers",
    "ManageContacts",
    "ManageIssuers",
    "Purge",
    "Recover",
    "Restore",
    "SetIssuers",
    "Update"
  ]

  key_permissions = [
    "Backup",
    "Create",
    "Decrypt",
    "Delete",
    "Encrypt",
    "Get",
    "Import",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Sign",
    "UnwrapKey",
    "Update",
    "Verify",
    "WrapKey",
    "Release",
    "Rotate",
    "GetRotationPolicy",
    "SetRotationPolicy"
  ]
}