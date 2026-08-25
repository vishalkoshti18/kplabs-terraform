# terraform {
#   required_providers {
#     github = {
#       source  = "integrations/github"
#       version = "~> 6.0"
#     }
#   }
# }

# provider "github" {
#   owner = "vishalkoshti18"
#   token = var.github_token
# }

# resource "github_repository" "example" {
#   name        = "example"
#   description = "My awesome codebase"

#   visibility = "public"
# }