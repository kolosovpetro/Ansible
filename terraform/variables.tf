variable "prefix" {
  type        = string
  description = "Resources name prefix"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "network_interface_name" {
  type        = string
  description = "Name of the network interface"
}

variable "ip_configuration_name" {
  type        = string
  description = "Name of the IP configuration"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
}

variable "storage_image_reference_publisher" {
  type        = string
  description = "The publisher of the image used to create the virtual machine."
}

variable "storage_image_reference_offer" {
  type        = string
  description = "Specifies the offer of the platform image or marketplace image used to create the virtual machine."
}

variable "storage_image_reference_sku" {
  type        = string
  description = "Specifies the SKU of the platform image or marketplace image used to create the virtual machine."
}

variable "storage_image_reference_version" {
  type        = string
  description = "Specifies the version of the platform image or marketplace image used to create the virtual machine."
}

variable "storage_os_disk_name" {
  type        = string
  description = "The name of the OS disk."
}

variable "storage_os_disk_caching" {
  type        = string
  description = "Specifies the caching requirements for the OS disk."
}

variable "storage_os_disk_create_option" {
  type        = string
  description = "Specifies how the virtual machine should be created."
}

variable "storage_os_disk_managed_disk_type" {
  type        = string
  description = "Specifies the storage account type for the managed disk."
}

variable "os_profile_computer_name" {
  type        = string
  description = "Specifies the host OS name of the virtual machine."
}

variable "os_profile_admin_username" {
  type        = string
  description = "Specifies the name of the administrator account."
}

variable "os_profile_admin_public_key_path" {
  type        = string
  description = "Specifies the public key of the administrator account."
}

variable "storage_account_name" {
  type        = string
  description = "Messenger storage account name"
}

variable "storage_container_name" {
  type        = string
  description = "Messenger storage container name"
}

variable "storage_account_tier" {
  type        = string
  description = "Messenger storage account tier"
}

variable "storage_account_replication" {
  type        = string
  description = "Messenger storage account replication strategy"
}