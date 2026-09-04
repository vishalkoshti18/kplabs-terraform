resource "aws_instance" "another_ec2" {
    ami = "ami-04fca11ec6cc2ddab"
    instance_type = "t3.micro"

    tags = {
      "Name" = "anotherec2"
    }

    lifecycle {
      create_before_destroy = true
      # prevent_destroy = true # used for resources like DB which must not accidently destroyed.
      ignore_changes = [ tags ]
    #   ignore_changes = all --> ignores changes to all attributes of the resource.
    }
}

# amazon linux ami - "ami-081b0a6eac00b4f53"
# windows ami - "ami-04fca11ec6cc2ddab"