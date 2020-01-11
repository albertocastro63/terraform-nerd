/**
 * Web Server and one security group.
 */

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.4"
}

module "web-security-group" {
  source = "./security_group"
  vpc_id = data.aws_vpc.default_vpc.id
}

module "web-server" {
  source             = "./ec2instance"
  ami_id             = var.ami_id
  security_group_ids = [module.web-security-group.security_group_id]
  type               = var.type
}
