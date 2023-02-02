
resource "azurerm_resource_group" "sonargroup" {
  name     = var.rgName
  location = var.location
}

resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                = "loganalytics"
  location            = var.location
  resource_group_name = azurerm_resource_group.sonargroup.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_container_group" "example" {
  name                = "sonar-cont-group"
  location            = var.location
  resource_group_name = azurerm_resource_group.sonargroup.name
  ip_address_type     = "Public"
  dns_name_label      = "sonar-${random_integer.suffix.result}"
  os_type             = "Linux"

  container {
    name   = "sonarqube"
    image  = "sonarqube:latest"
    cpu    = "2"
    memory = "3.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
    ports {
      port     = 9000
      protocol = "TCP"
    }
  }
  diagnostics {
    log_analytics {
      workspace_id  = azurerm_log_analytics_workspace.loganalytics.workspace_id
      workspace_key = azurerm_log_analytics_workspace.loganalytics.primary_shared_key
    }
  }
}

resource "time_sleep" "wait_90_seconds" {
    depends_on = [
        azurerm_container_group.example
    ]
    create_duration = "90s"
}