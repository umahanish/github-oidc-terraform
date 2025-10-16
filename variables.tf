variable "aws_region" { description = "AWS region" type = string }
variable "vpc_cidr" { description = "VPC CIDR" type = string }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "availability_zones" { type = list(string) }
variable "tags" { type = map(string) }
