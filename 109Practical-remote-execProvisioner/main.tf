data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.18-x86_64"]
  }
}

#added comment

variable "http_ssh" {
  type        = list(number)
  description = "allow http traffic"
  default     = [80, 22]
}

resource "aws_security_group" "allow_inbound" {
  name        = "allow_ssh_http"
  description = "this SG will allow http and ssh traffic"
  
  tags = {
    Name = "allow_http_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web" {
  security_group_id = aws_security_group.allow_inbound.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = var.http_ssh[0]
  ip_protocol = "tcp"
  to_port     = var.http_ssh[0]
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.allow_inbound.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = var.http_ssh[1]
  ip_protocol = "tcp"
  to_port     = var.http_ssh[1]
}

resource "aws_instance" "my_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  key_name = "terraform-key"
  vpc_security_group_ids = [aws_security_group.allow_inbound.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    port        = 22
    private_key = file("./terraform-key.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}