/**
 * EC2 instance in AWS creted in terraform (v2).
 */

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.00"
}

variable "ami_id" {
  description = "Id for the machine image to use to create the ec2 instance"
  type = string
  default = "ami-00068cd7555f543d5"
}

variable "type" {
  description = "Type of instance in AWS to create."
  type = string
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform_nerd"
}

resource "aws_instance" "myapp" {
  ami = var.ami_id
  instance_type = var.type
  key_name = var.key_name
}

output "public_ip" {
  value = aws_instance.myapp.public_ip
}

output "availability_zone" {
  value = aws_instance.myapp.availability_zone
}