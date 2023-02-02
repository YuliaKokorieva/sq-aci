provider "azurerm" {
  features {}
}

module "RemoteState" {
  source = "./modules/remote_state"
  resource_group_name = var.tfstate-rgName
  location=var.location
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
