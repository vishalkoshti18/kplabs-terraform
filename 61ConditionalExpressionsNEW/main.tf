provider "aws" {
  region = "us-east-1"
}

variable "envirnoment" {
  default = "prod"
  type = string
}

variable "region" {
  default = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = var.envirnoment != "prod" ? "m5.large" : "t2.micro"
  tags = {
    Name = "helloworld-${count.index}"
  }
  count = 1
}

resource "aws_instance" "myec21" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = var.envirnoment == "prod" && var.region == "us-east-1" ? "m5.large" : "t2.micro"
  tags = {
    Name = "helloworld-${count.index}"
  }
  count = 1
}