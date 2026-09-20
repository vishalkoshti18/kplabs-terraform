data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "amzn-s3-bucket-demo-0077"
    key    = "eip.tfstate"
    region = "us-east-1"
  }
}