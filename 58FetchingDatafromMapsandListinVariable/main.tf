provider "aws" {
  
}

variable "list" {
  default = ["m5.large", "m5.xlarge", "t2.medium"]
  type = list
}

variable "types" {
  default = {
    "ap-south-1" = "t3.micro"
    "us-east-1" = "t3.small"
    "us-west-2" = "t2.nano"
  }
  type = map
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = var.types["us-west-2"]

  tags = {
    Name = "HelloWorld"
  }
}