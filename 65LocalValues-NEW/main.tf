locals {
  sg_name = {
    "name" = "sg_02"
  }
  tags = {
    CreationTimeDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}

resource "aws_security_group" "sg01" {
  name        = "sg_01"
  description = "Allow TLS inbound traffic and all outbound traffic"
}

resource "aws_security_group" "sg02" {
  name        = local.sg_name["name"]
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    CreationTimeDate = local.tags["CreationTimeDate"]
  }
}