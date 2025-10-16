aws_region = "eu-west-2"
vpc_cidr = "10.20.0.0/16"
public_subnets  = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnets = ["10.20.3.0/24", "10.20.4.0/24"]
availability_zones = ["eu-west-2a", "eu-west-2b"]
tags = {
  Environment = "stage"
  Project     = "aws-vpc-demo"
  Owner       = "CloudOps"
}
