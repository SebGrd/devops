output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.kube.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.kube.kube_config_raw
  sensitive = true
}

output "account_id" {
  value = data.azuread_client_config.current.object_id
}