terraform {
  backend "s3" {
    bucket = "3-tier-architecture-bucket-vipul-288761733137"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}