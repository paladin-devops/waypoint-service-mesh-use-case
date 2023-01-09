resource "azurerm_resource_group" "waypoint_service_mesh_use_case" {
  name     = "paladin-devops"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "waypoint_service_mesh_use_case" {
  name                = "paladin-devops"
  location            = azurerm_resource_group.waypoint_service_mesh_use_case.location
  resource_group_name = azurerm_resource_group.waypoint_service_mesh_use_case.name
  dns_prefix = "paladindevops"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Purpose = "use-case-demo"
    Waypointer = "paladin-devops"
  }
}