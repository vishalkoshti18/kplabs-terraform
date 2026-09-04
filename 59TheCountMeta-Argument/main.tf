terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.61.0"
    }
  }
}

# resource "aws_instance" "myec2" {
#   ami           = "ami-0b6d9d3d33ba97d99"
#   instance_type = "t3.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
#   count = abs(-3)
# }

#---------------------------------------------------------

resource "aws_iam_user" "name" {
  name  = abs(-8888)
  count = abs(-3)
}