resource "aws_route_table" "public-rt" {
  count=length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.solar-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.cluster_name}-public-${count.index + 1}"
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidrs)
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public-rt[count.index].id
}


resource "aws_route_table" "private-rt" {
  count=length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.solar-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[count.index].id
  }

  tags = {
    Name = "${var.cluster_name}-private-${count.index + 1}"
  }
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidrs)
  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private-rt[count.index].id
}