terraform {

  backend "s3" {
    bucket  = "project-aws-backend"
    region  = "us-east-1"
    key     = "GCP/module/IAM/terraform.tfstate"
    encrypt = true
  }
}
