resource "aws_vpc" "default" {
    cidr_block = var.cidr_block

    tags = {
        Name = "${var.name}"
    }
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.default.id

    tags = {
        Name = "${var.name}"
    }
}
