variable "public_ip_name" {
  type        = string
  description = "Name of the public IP"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
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

variable "storage_image_reference_sku" {
  type        = string
  description = "Specifies the SKU of the platform image or marketplace image used to create the virtual machine."
}

variable "storage_os_disk_name" {
  type        = string
  description = "The name of the OS disk."
}

variable "os_profile_computer_name" {
  type        = string
  description = "Specifies the host OS name of the virtual machine."

  validation {
    condition     = length(var.os_profile_computer_name) < 15
    error_message = "The VM name must be less than 15 characters."
  }
}

variable "os_profile_admin_username" {
  type        = string
  description = "Specifies the name of the administrator account."
}

variable "os_profile_admin_password" {
  type        = string
  description = "Specifies the password of the administrator account."
}
variable "network_security_group_id" {
  type        = string
  description = "ID of the network security group"
}

variable "private_ip_address" {
  type        = string
  description = "Private IP address of the virtual machine"
}

# variable "image_resource_group_name" {
#   type        = string
#   description = "Name of the resource group where the image is stored"
# }