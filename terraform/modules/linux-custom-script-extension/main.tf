resource "azurerm_storage_blob" "public" {
  name                   = var.custom_script_extension_file_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
  source                 = var.custom_script_extension_absolute_path
}

resource "azurerm_virtual_machine_extension" "public" {
  name                 = var.extension_name
  virtual_machine_id   = var.virtual_machine_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  depends_on = [
    azurerm_storage_blob.public
  ]

  settings = <<SETTINGS
        {
            "fileUris": [
                "${azurerm_storage_blob.public.url}"
                ],
            "commandToExecute": "bash ${var.custom_script_extension_file_name}"
        }
    SETTINGS
}
