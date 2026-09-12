provider "aws" {
  region = "us-east-1"
}

module "ec2" { #this is a root module where you are calling a child module (EC2)
  source = "../123CustomModuleTerraform/modules/ec2"
  instance_type = "t3.micro"
}

resource "aws_eip" "myeip" {
  instance = module.ec2.instance_id
}