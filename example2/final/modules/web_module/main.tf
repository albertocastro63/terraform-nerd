/**
 * Web and Application Servers.
 */

module "s3_bucket" {
  source = "../s3_bucket"

  bucket_name_prefix = var.bucket_prefix
  bucket_region      = var.region_name
}

module "dynamodb_table" {
  source     = "../dynamodb_table"
  table_name = var.dynamodb_table_name
}

module "web-security-group" {
  source = "../security_group"
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
  source = "../security_group"
  vpc_id = data.aws_vpc.default_vpc.id
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [join("", [var.my_local_ip, "/32"])]
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
  source             = "../ec2instance"
  ami_id             = var.ami_id
  security_group_ids = [module.web-security-group.security_group_id, module.application-security-group.security_group_id]
  type               = var.type_instance
  instance_profile   = var.instance_profile
  key_name           = var.key_name
}

module "application-server" {
  source             = "../ec2instance"
  ami_id             = var.ami_id
  security_group_ids = [module.application-security-group.security_group_id]
  type               = var.type_instance
  instance_profile   = var.instance_profile
  key_name           = var.key_name
}
