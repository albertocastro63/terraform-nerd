/**
 * security_group module outputs
 */

resource "aws_security_group" "thesecuritygroup" {
  vpc_id = var.vpc_id

  revoke_rules_on_delete = true
}

resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
  count = length(var.ingress_with_cidr_blocks)

  security_group_id = aws_security_group.thesecuritygroup.id
  type              = "ingress"

  cidr_blocks = var.ingress_with_cidr_blocks[count.index]["cidr_blocks"]
  from_port   = var.ingress_with_cidr_blocks[count.index]["from_port"]
  to_port     = var.ingress_with_cidr_blocks[count.index]["to_port"]
  protocol    = var.ingress_with_cidr_blocks[count.index]["protocol"]
}

resource "aws_security_group_rule" "egress_with_cidr_blocks" {
  count = length(var.egress_with_cidr_blocks)

  security_group_id = aws_security_group.thesecuritygroup.id

  type        = "egress"
  cidr_blocks = var.egress_with_cidr_blocks[count.index]["cidr_blocks"]
  from_port   = var.egress_with_cidr_blocks[count.index]["from_port"]
  to_port     = var.egress_with_cidr_blocks[count.index]["to_port"]
  protocol    = var.egress_with_cidr_blocks[count.index]["protocol"]
}

resource "aws_security_group_rule" "self_rule" {
  security_group_id = aws_security_group.thesecuritygroup.id

  from_port = 0
  protocol  = -1
  to_port   = 0
  type      = "ingress"
  self      = true
}
