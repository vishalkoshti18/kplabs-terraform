# variable "username" {
#   default     = "1234"
#   description = "only numerical users are allowed"
#   type        = number
# }

# resource "aws_iam_user" "myuser" {
#   name = var.username
# }

# resource "aws_instance" "myec2" {
#   ami           = "ami-0b6d9d3d33ba97d99"
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [ "sg-0920c8fb2e56172eb" ]

# }


# execute above block seperate by uncommenting to it use terraformtfvars to define values of variables
#----------------------------------------------------------------------------------------------------
# execute above block seperate by uncommenting to it use terraformtfvars to define values of variables


#list data type

variable "my-list" {
  default = ["1","3"]
  type = list
}

output "print_val" {
  value = var.my-list
}

resource "aws_instance" "myec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ "sg-0920c8fb2e56172eb", "sg-0920c8fb2e56172eb" ]
}

