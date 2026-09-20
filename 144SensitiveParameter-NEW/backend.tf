terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "amzn-s3-bucket-demo-0077"
    key = "144/sensitive.tfstate"
    use_lockfile = true
  }
}