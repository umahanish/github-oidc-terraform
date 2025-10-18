variable "aws_region" { default = "eu-west-2" }
variable "vpc_cidr" { default = "10.10.0.0/16" }
variable "public_subnets" { default = ["10.10.1.0/24", "10.10.2.0/24"] }
variable "private_subnets" { default = ["10.10.101.0/24", "10.10.102.0/24"] }
variable "availability_zones" { default = ["eu-west-2a", "eu-west-2b"] }
variable "environment" {
  type    = string
  default = "dev"
}
variable "tags" {
  type = map(string)
  default = {
    Project = "aws-vpc-demo"
    Owner   = "PlatformTeam"
  }
}

