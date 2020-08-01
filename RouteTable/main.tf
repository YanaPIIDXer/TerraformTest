resource "aws_route_table" "default" {
  vpc_id = var.vpc_id

  tags = {
      Name = var.name
  }
}

resource "aws_route_table_association" "subnet_association" {
    count = length(var.subnets)
    subnet_id = var.subnets[count.index].id
    route_table_id = aws_route_table.default.id
}

resource "aws_route_table_association" "gateway_association" {
    count = var.internet_gateway_id != null ? 1 : 0
    gateway_id = var.internet_gateway_id
    route_table_id = aws_route_table.default.id
}
