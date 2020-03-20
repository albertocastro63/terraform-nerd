/**
 * Web and Application Servers.
 */

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.4"
}

module "web-security-group" {
  source = "./security_group"
  vpc_id = data.aws_vpc.default_vpc.id
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "application-security-group" {
  source = "./security_group"
  vpc_id = data.aws_vpc.default_vpc.id
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.my_local_ip]
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "web-server" {
  source             = "./ec2instance"
  ami_id             = var.ami_id
  security_group_ids = [module.web-security-group.security_group_id]
  type               = var.type_instance
  name               = "Example 2.2 web"
}

module "webapp-server" {
  source             = "./ec2instance"
  ami_id             = var.ami_id
  security_group_ids = [module.web-security-group.security_group_id, module.application-security-group.security_group_id]
  type               = var.type_instance
  name               = "Example 2.2 - webapp"
}

module "application-server" {
  source             = "./ec2instance"
  ami_id             = var.ami_id
  security_group_ids = [module.application-security-group.security_group_id]
  type               = var.type_instance
  name               = "Example 2.2 app"
}
