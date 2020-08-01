resource "aws_security_group_rule" "default" {
  security_group_id = var.security_group_id
  type              = var.type
  from_port         = var.from
  to_port           = var.to
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
}
