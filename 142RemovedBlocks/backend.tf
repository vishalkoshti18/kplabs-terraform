terraform {
  backend "s3" {
    region       = "us-east-1"
    key          = "142/removedblock.tfstate"
    bucket       = "amzn-s3-bucket-demo-0077"
    use_lockfile = true
  }
}