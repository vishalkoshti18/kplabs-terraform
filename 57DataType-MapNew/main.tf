variable "instance_tags" {
  default = {
    Name = "XBOX",
    Game = "PS4"
  }
  type = map(any)
  description = "Name of the launched EC2 instance"
}

provider "aws" {
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  tags = var.instance_tags
}