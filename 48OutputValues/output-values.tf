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
resource "aws_eip" "lb" {
}
output "lb_eip" {
  value = aws_eip.lb.public_ip
}