resource "aws_instance" "default" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = var.security_groups

  tags = {
    Name = var.name
  }
}
