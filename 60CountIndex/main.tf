terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.61.0"
    }
  }
}

provider "aws" {

}

variable "users" {
  default = ["Alice", "bob", "johncorner"]
}

resource "aws_iam_user" "that" {
  name  = var.users[count.index]
  count = 3
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  tags = {
    Name = "helloworld-${count.index}"
  }
  count = 3
}