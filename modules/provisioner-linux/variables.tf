variable "os_profile_admin_username" {
  type        = string
  description = "The administrator username for the virtual machine."
}

variable "private_key_path" {
  type        = string
  description = "The path to the private SSH key used for connecting to the VM."
}

variable "vm_public_ip_address" {
  type        = string
  description = "The public IP address of the virtual machine used for SSH connections."
}

variable "provision_script_path" {
  type        = string
  description = "The local path to the script that will be copied and executed on the VM."
}

variable "provision_script_destination" {
  type        = string
  description = "The destination path on the VM where the script will be copied."
}
