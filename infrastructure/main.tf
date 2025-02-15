provider "azurerm" {
  features {}
}

variable "location" {
  default = "eastus"
}

variable "resource_group_name" {
  default = "container01"
}

variable "acr_name" {
  default = "containerpracticeproject"
}

variable "container_name" {
  default = "sampletodoapp"
}

variable "dns_label" {
  default = "abhinav-demo-project"
}

variable "image_tag" {
  default = "latest"
}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Deploy Azure Container Instance (ACI)
resource "azurerm_container_group" "container" {
  name                = var.container_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  container {
    name   = var.container_name
    image  = "${azurerm_container_registry.acr.login_server}/${var.container_name}:${var.image_tag}"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

    environment_variables = {
      NODE_ENV = "production"
    }

    secure_environment_variables = {
      REGISTRY_USERNAME = azurerm_container_registry.acr.admin_username
      REGISTRY_PASSWORD = azurerm_container_registry.acr.admin_password
    }
  }

  ip_address_type = "Public"
  dns_name_label  = var.dns_label
}

output "container_url" {
  value = "http://${azurerm_container_group.container.fqdn}"
}
