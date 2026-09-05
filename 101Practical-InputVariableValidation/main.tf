variable "db_password" {
  type        = string
  description = "this is a database password and no_log must be on"

  validation {
    condition     = length(var.db_password) >= 12
    error_message = "Please enter the string value and the pass lenght must be >=12 "
  }
  sensitive = false
}

output "db_password" {
  value = var.db_password
}