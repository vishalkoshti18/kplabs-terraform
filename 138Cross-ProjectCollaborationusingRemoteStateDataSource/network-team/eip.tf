resource "aws_eip" "lb" {
  domain = "vpc"
}

output "eip_value" {
  value = aws_eip.lb.public_ip
}