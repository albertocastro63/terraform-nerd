/**
 * EC2 instance in AWS creted in terraform (v3).
 */


resource "aws_instance" "theinstance" {
  ami                    = var.ami_id
  instance_type          = var.type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.name
  }
}
