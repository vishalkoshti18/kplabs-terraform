locals {
  instance_type = {
    default = "t3.micro"
    staging = "t3.nano"
    production = "t3.small"
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

resource "aws_instance" "my_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = local.instance_type[terraform.workspace]
}