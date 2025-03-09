terraform {
  backend "s3" {
    bucket  = "alismed-terraform"
    key     = "rds/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
