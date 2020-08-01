resource "aws_route_table" "default" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}

resource "aws_route" "gateway_route" {
  count                  = length(var.gateways)
  route_table_id         = aws_route_table.default.id
  gateway_id             = var.gateways[count.index].id
  destination_cidr_block = var.gateways[count.index].cidr_block
}

resource "aws_route_table_association" "subnet_association" {
  count          = length(var.subnets)
  route_table_id = aws_route_table.default.id
  subnet_id      = var.subnets[count.index].id
}
