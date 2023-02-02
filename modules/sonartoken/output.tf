output "user_token" {
  value     = sonarqube_user_token.token.token
  sensitive = true
}

output "project_key" {
  value=sonarqube_project.sonarproject.project
  
}