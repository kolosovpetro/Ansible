variable "windows_servers" {
  description = "Details of the Windows servers module output"
  type = map(object({
    network_interface_id  = string
    ip_configuration_name = string
  }))
}

variable "agwy_public_ip_name" {
  type        = string
  description = "Name of the public IP address for the Application Gateway."
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be deployed."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group containing the Application Gateway."
}

variable "snet_agwy_frontend_name" {
  type        = string
  description = "Name of the subnet for the Application Gateway's frontend."
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network containing the Application Gateway."
}

variable "agwy_name" {
  type        = string
  description = "Name of the Application Gateway resource."
}

variable "gateway_ip_configuration_name" {
  type        = string
  description = "Name of the gateway IP configuration for the Application Gateway."
}

variable "frontend_port_name" {
  type        = string
  description = "Name of the frontend port configuration for the Application Gateway."
}

variable "frontend_ip_configuration_name" {
  type        = string
  description = "Name of the frontend IP configuration for the Application Gateway."
}

variable "agwy_backend_pool_name" {
  type        = string
  description = "Name of the backend address pool for the Application Gateway."
}

variable "backend_http_settings_name" {
  type        = string
  description = "Name of the backend HTTP settings for the Application Gateway."
}

variable "http_listener_name" {
  type        = string
  description = "Name of the HTTP listener for the Application Gateway."
}

variable "ssl_certificate_name" {
  type        = string
  description = "Name of the SSL certificate for the Application Gateway."
}

variable "ssl_certificate_path" {
  type        = string
  description = "Path to the SSL certificate file for the Application Gateway."
}

variable "ssl_certificate_password" {
  type        = string
  description = "Password for the SSL certificate file."
}

variable "request_routing_rule_name" {
  type        = string
  description = "Name of the request routing rule for the Application Gateway."
}