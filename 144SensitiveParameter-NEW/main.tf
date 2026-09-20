variable "pass" {
  default = "supersecretpassword!"
  sensitive = true
}

resource "local_file" "name" {
  content = var.pass
  filename = "foo.txt"
}

output "pass_value" {
#   value = local_file.name.content #gives error - Error: Output refers to sensitive values

  value = local_file.name.content
  sensitive = true
}