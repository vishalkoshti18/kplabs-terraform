# resource "aws_instance" "myec2" {
#     ami = "ami-04fca11ec6cc2ddab"
#     instance_type = "t3.micro"

#     lifecycle {
#       ignore_changes = [ tags ]
#     }

#     tags = {
#       "Name" = "HelloWorld"
#       "Teams" = "Payments"
#       "Another" = "Tag"
#     }
# }
# ami-04fca11ec6cc2ddab -win