/**
 * EC2 instance in AWS creted in terraform (v3).
 */

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.00"
}

resource "aws_security_group" "ec2_security_group" {
  vpc_id = data.aws_vpc.default_vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }
}

resource "aws_instance" "myapp" {
  ami                    = var.ami_id
  instance_type          = var.type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
}
