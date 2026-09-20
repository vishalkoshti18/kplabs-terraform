provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.18-x86_64"]
  }
}

#want below resource in us-east-1
resource "aws_instance" "my_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  tags = {
    "region" = "Virginia"
  }
}

#want below resource in ap-south-1
resource "aws_security_group" "mysg" {
  provider = aws.mumbai
  name     = "mysg"
}