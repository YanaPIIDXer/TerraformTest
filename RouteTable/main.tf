resource "aws_route_table" "default" {
  vpc_id = var.vpc_id

  tags = {
      Name = var.name
  }
}

resource "aws_route" "gateway_route" {
    count = var.use_internet_gateway ? 1 : 0
    destination_cidr_block = "0.0.0.0/0"
    route_table_id = aws_route_table.default.id
    gateway_id = var.internet_gateway_id
}

resource "aws_route_table_association" "subnet_association" {
    count = length(var.subnets)
    subnet_id = var.subnets[count.index].id
    route_table_id = aws_route_table.default.id
}
