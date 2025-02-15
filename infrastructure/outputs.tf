output "container_url" {
  value = "http://${azurerm_container_group.container.fqdn}"
  description = "Public URL of the deployed container"
}
