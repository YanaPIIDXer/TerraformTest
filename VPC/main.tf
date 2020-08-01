resource "aws_vpc" "default" {
  cidr_block = var.cidr_block

  tags = {
    Name = "${var.name}"
  }
}

resource "aws_subnet" "public_subnets" {
  count      = length(var.public_subnets)
  vpc_id     = aws_vpc.default.id
  cidr_block = element(var.public_subnets, count.index)
  tags = {
    Name = join("", list("${var.name}", "_public_", "${count.index}"))
  }
}

resource "aws_subnet" "private_subnets" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.default.id
  cidr_block = element(var.private_subnets, count.index)
  tags = {
    Name = join("", list("${var.name}", "_private_", "${count.index}"))
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  count  = (length(var.public_subnets) > 0) ? 1 : 0
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.name}"
  }
}
