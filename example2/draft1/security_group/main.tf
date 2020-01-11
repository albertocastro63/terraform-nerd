/**
 * security_group module outputs
 */

resource "aws_security_group" "ec2_security_group" {
  vpc_id = var.vpc_id

  revoke_rules_on_delete = true
}

resource "aws_security_group_rule" "self_rule" {
  security_group_id = aws_security_group.ec2_security_group.id

  from_port = 0
  protocol = -1
  to_port = 0
  type = "ingress"
  self = true
}

resource "aws_security_group_rule" "ssh_in" {
  security_group_id = aws_security_group.ec2_security_group.id

  from_port = 22
  protocol = "tcp"
  to_port = 22
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http_in" {
  security_group_id = aws_security_group.ec2_security_group.id

  from_port = 80
  protocol = "tcp"
  to_port = 80
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "all_out" {
  security_group_id = aws_security_group.ec2_security_group.id

  from_port = 0
  protocol = -1
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}
