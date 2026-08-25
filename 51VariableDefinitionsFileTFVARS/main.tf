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
resource "aws_security_group" "allow_web_traffic" {
  name        = "allow_web_traffic"
  description = "allow_web_traffic"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_web_traffic.id

  cidr_ipv4   = var.vpn_ip
  from_port   = var.http
  ip_protocol = "tcp"
  to_port     = var.http
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.allow_web_traffic.id

  cidr_ipv4   = var.vpn_ip
  from_port   = var.https
  ip_protocol = "tcp"
  to_port     = var.https
}

