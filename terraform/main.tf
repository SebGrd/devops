resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

resource "azurerm_container_registry" "acr" {
  name                = var.registry_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Standard"
  admin_enabled       = false
}



resource "azurerm_kubernetes_cluster" "kube" {
  name                = var.kube_cluster_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.kube_cluster_dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_a2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

}

resource "azurerm_public_ip" "publicip" {
  name                = var.publicip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
}

resource "azurerm_role_assignment" "kubeacrpull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.kube.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}