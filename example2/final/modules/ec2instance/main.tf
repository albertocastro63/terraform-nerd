/**
 * EC2 instance in AWS creted in terraform (v3).
 */

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile   = var.instance_profile

  tags = {
    Name = var.name
  }
}
