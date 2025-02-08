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

variable "snet_windows_name" {
  type        = string
  description = "Name of the subnet"
}

variable "nsg_name" {
  type        = string
  description = "Name of the network security group"
}

variable "snet_linux_name" {
  type        = string
  description = "Name of the subnet"
}