provider "aws" {
  region = "us-east-1"
}

import {
  id = "sg-091f0807744af027d"
  to = aws_security_group.allow_inbound
}
