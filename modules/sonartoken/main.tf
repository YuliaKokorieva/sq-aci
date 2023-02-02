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

# resource "sonarqube_user" "new_admin" {
#   login_name = "terraform-test"
#   name       = "terraform-test"
#   password   = "secret-sauce37!"
# }

# resource "sonarqube_permissions" "my_global_admins" {
#     login_name = sonarqube_user.new_admin.login_name
#     permissions = ["admin"]
# }

resource "sonarqube_user_token" "token" {
  login_name = var.sq_admin_login
  name       = "sq-token"
}

resource "sonarqube_project" "sonarproject" {
  name="sonar"
  project="test"
  visibility = "private"
  
}

