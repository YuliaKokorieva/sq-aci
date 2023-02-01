terraform {
  required_providers {
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "0.15.5"
    }
  }
}

provider "sonarqube" {
  user =var.sq_admin_login
  pass = var.sq_admin_login_password
  host ="http://${var.sq_host}:9000"
}

resource "sonarqube_user_token" "token" {
  login_name = var.sq_admin_login
  name       = "sq-token"
}

