locals {
  rg_name     = "${var.resource_group_name}-${var.prefix}"
  nsg_name    = "${var.nsg_name}-${var.prefix}"
  subnet_name = "${var.subnet_name}-${var.prefix}"
  vnet_name   = "${var.vnet_name}-${var.prefix}"

  control_node = {
    indexer                  = "control_node"
    ip_configuration_name    = "ipc-control-node-${var.prefix}"
    network_interface_name   = "nic-control-node-${var.prefix}"
    public_ip_name           = "pip-control-node-${var.prefix}"
    os_profile_computer_name = "control-node"
    storage_os_disk_name     = "os-disk-control-node-${var.prefix}"
    vm_name                  = "vm-control-node-${var.prefix}"
    dns_name                 = "ansible.control.node"
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
      dns_name                 = "ansible.webserver"
    }
    db_server_linux = {
      indexer                  = "db_server_linux"
      ip_configuration_name    = "ipc-db-server-${var.prefix}"
      network_interface_name   = "nic-db-server-${var.prefix}"
      public_ip_name           = "pip-db-server-${var.prefix}"
      os_profile_computer_name = "db-server"
      storage_os_disk_name     = "os-disk-db-server-${var.prefix}"
      vm_name                  = "vm-db-server-${var.prefix}"
      dns_name                 = "ansible.dbserver"
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
      dns_name                    = "ansible.win.webserver"
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
      dns_name                    = "ansible.win.dbserver"
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