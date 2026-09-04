terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.67.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

variable "sg_port" {
  type        = list(number)
  default = [ 80, 443, 8080, 8443, 53 ]
}


resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = var.sg_port
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      =[ "0.0.0.0/0"]
    }
  }
}



#-----------------------------------------------------------------------------------------
#below is the example of how you can create a resource withoutusng hte dynamic block.




# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.main.cidr_block]
#     ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
#   }
# }