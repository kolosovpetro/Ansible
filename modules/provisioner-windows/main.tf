resource "null_resource" "provisioner_windows" {
  provisioner "file" {
    source      = var.provision_script_path
    destination = var.provision_script_destination

    connection {
      type     = "winrm"
      user     = var.os_profile_admin_username
      password = var.os_profile_admin_password
      host     = var.public_ip_address
      port     = 5986
      https    = true
      timeout  = "2m"
      use_ntlm = true
      insecure = true
    }
  }
  provisioner "remote-exec" {
    connection {
      type     = "winrm"
      user     = var.os_profile_admin_username
      password = var.os_profile_admin_password
      host     = var.public_ip_address
      port     = 5986
      https    = true
      timeout  = "2m"
      use_ntlm = true
      insecure = true
    }

    inline = [
      "powershell.exe -ExecutionPolicy Bypass -File ${var.provision_script_destination}"
    ]
  }
}