#pre - need to check if the instance is a free tier and only use it.
#post - need to verify the instance is having public IP

data "aws_ec2_instance_type" "example" {
  instance_type = "t3.micro"
}

data "aws_ami" "ubuntu_26_04" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name = "name"
    # Matches the official Ubuntu 26.04 LTS "Resolute Raccoon" server AMIs
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "name" {
  ami = data.aws_ami.ubuntu_26_04.id
  instance_type = data.aws_ec2_instance_type.example.id

  lifecycle {
    precondition {
      condition = data.aws_ec2_instance_type.example.free_tier_eligible == true
      error_message = "Please choose the free tier instance type"
    }

    postcondition {
      condition = self.public_ip != ""
      error_message = "This instance is having public IP"
    }
  }
}

output "public_ip_of_instance" {
  value = aws_instance.name.public_ip
    precondition {
        condition = aws_instance.name.public_ip != ""
        error_message = "Bro check the condition of the output block once"
    }
}
