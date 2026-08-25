terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "example" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = var.instance_type
}