output "user_token" {
  value     = module.SonarToken.user_token
  sensitive = true
}

output "project_key" {
  value=module.SonarToken.project_key
}