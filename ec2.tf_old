#####################################################
# EC2 Deployment using existing VPC from remote state
#####################################################

# --- Variables ---
variable "environment" {
  type    = string
  default = "dev"
  description = "Environment to deploy (dev/stage/prod)"
}

variable "key_pair_name" {
  type        = string
  description = "SSH key pair name for EC2 instance"
}

# --- Get existing VPC and Subnets from remote state ---
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "github-oidc-bucket-terraform"                # Your S3 bucket name
    key    = "aws-vpc/${var.environment}/terraform.tfstate" # Remote VPC state path
    region = "eu-west-2"                                   # VPC region
  }
}

# --- Security Group ---
resource "aws_security_group" "web_sg" {
  name        = "web-sg-${var.environment}"
  description = "Allow SSH and HTTP"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebSecurityGroup-${var.environment}"
  }
}

# --- EC2 Instance ---
resource "aws_instance" "web" {
  ami                         = "ami-046c2381f11878233"  # Ubuntu 22.04 LTS (eu-west-2)
  instance_type               = "t3.micro"
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
  associate_public_ip_address = true
  key_name                    = var.key_pair_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "PublicEC2Instance-${var.environment}"
  }
}

# --- Output the public IP of the EC2 instance ---
output "ec2_public_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of the EC2 instance"
}
