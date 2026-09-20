terraform {
  backend "s3" {
    bucket       = "amzn-s3-bucket-demo-0077"
    key          = "import/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}