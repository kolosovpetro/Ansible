resource "null_resource" "file_provision" {
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = var.os_profile_admin_username
      private_key = file(var.private_key_path)
      host        = var.vm_public_ip_address
    }

    source      = var.provision_script_path
    destination = var.provision_script_destination
  }
}

resource "null_resource" "remote_exec_provision" {
  depends_on = [null_resource.file_provision]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.os_profile_admin_username
      private_key = file(var.private_key_path)
      host        = var.vm_public_ip_address
      timeout     = "2m"
    }

    inline = [
      "chmod +x ${var.provision_script_destination}",
      var.provision_script_destination
    ]
  }
}
