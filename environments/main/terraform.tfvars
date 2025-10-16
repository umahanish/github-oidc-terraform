aws_region = "eu-west-2"
vpc_cidr = "10.30.0.0/16"
public_subnets  = ["10.30.1.0/24", "10.30.2.0/24"]
private_subnets = ["10.30.3.0/24", "10.30.4.0/24"]
availability_zones = ["eu-west-2a", "eu-west-2b"]
tags = {
  Environment = "prod"
  Project     = "aws-vpc-demo"
  Owner       = "EnterpriseArchitecture"
}
