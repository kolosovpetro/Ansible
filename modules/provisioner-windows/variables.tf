variable "os_profile_admin_username" {
  type        = string
  description = "The administrator username for the Windows virtual machine."
}

variable "os_profile_admin_password" {
  type        = string
  sensitive   = true
  description = "The administrator password for the Windows virtual machine."
}

variable "provision_script_path" {
  type        = string
  description = "The local path to the PowerShell script that will be copied to the Windows VM."
}

variable "provision_script_destination" {
  type        = string
  description = "The destination path on the Windows VM where the script will be copied."
}

variable "public_ip_address" {
  type        = string
  description = "The public IP address of the Windows target node."
}
