terraform {

  backend "s3" {
    bucket  = "my-terraform.tfstate-files"
    region  = "us-east-1"
    key     = "AWS/module/EKS/terraform.tfstate"
    encrypt = true
  }
}
