variable "rgName" {
  description = "sonar RG name"
  default     = "sonar-rg"
}

variable "location" {
  description = "Azure Default location"
  default     = "westeurope"
}

variable "sq_admin_login" {
  default = "admin"
}

variable "sq_admin_login_password" {
  default = "admin"
}

variable "tfstate-rgName" {
  description = "tfstate RG name"
  default     = "tfstate-rg"
}