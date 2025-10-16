aws_region = "us-east-1"
vpc_cidr = "10.10.0.0/16"
public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets = ["10.10.3.0/24", "10.10.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
tags = {
  Environment = "dev"
  Project     = "aws-vpc-demo"
  Owner       = "PlatformTeam"
}
