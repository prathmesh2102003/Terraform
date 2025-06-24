terraform {
  backend "s3" {
    bucket = "0209bucket"
    region = "us-east-1"
    key = "AWS/module/IAM/terraform.tfstate"
    encrypt = true
  }
}