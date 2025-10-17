terraform {
  backend "s3" {
    bucket         = "github-oidc-bucket-terraform"       # <-- replace with your S3 bucket name
   # key            = "aws-vpc/${terraform.workspace}/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock-table"            # <-- replace with your DynamoDB table name
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}