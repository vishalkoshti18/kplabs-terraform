terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.18-x86_64"]
  }
}

variable "instance_type" {
  type = string
}

resource "aws_instance" "my_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
}

output "instance_id" {
  value = aws_instance.my_server.id
}