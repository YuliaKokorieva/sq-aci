terraform {
  required_providers {
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "0.15.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.40.0"
    }
  }
}