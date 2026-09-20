terraform {
  backend "s3" {
    bucket       = "amzn-s3-bucket-demo-0077"
    key          = "security.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}