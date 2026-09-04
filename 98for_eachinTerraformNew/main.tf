variable "my-set" {
    type = set(string)
    description = "A set of strings"
    default = ["aditi", "rutvik", "shayna"]
}

resource "aws_iam_user" "name" {
  for_each = var.my-set
  name = each.value
}

variable "my-map" {
  type = map(string)
  default = {
    "firstec2" = "ami-123"
    "secondec2" = "ami-321"
  }
}

resource "aws_instance" "myec2" {
  for_each = var.my-map
  ami = each.value

  instance_type = "t3.micro"

  tags = {
    "Name" = each.key
  }
}