aws_region = "eu-west-2"
# environment     = "dev"
# backend_bucket  = "github-oidc-bucket-terraform"
# dynamodb_table  = "terraform-locks"
key_pair_name   = "cognex6"
vpc_cidr = "10.10.0.0/16"
public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets = ["10.10.3.0/24", "10.10.4.0/24"]
availability_zones = ["eu-west-2a", "eu-west-2b"]
tags = {
  Environment = "dev"
  Project     = "aws-vpc-demo"
  Owner       = "PlatformTeam"
}
