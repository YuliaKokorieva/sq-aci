provider "azurerm" {
  features {}
}

module "SonarServer" {
  source   = "./modules/sonarserver"
  location = var.location
  rgName   = var.rgName
}

module "SonarToken" {
  source                  = "./modules/sonartoken"
  sq_admin_login          = var.sq_admin_login
  sq_admin_login_password = var.sq_admin_login_password
  sq_host                 = module.SonarServer.sonar_host
}
