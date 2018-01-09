resource "aws_route_table" "public-1" {
  vpc_id = "${aws_vpc.services.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
  tags {
    Name = "Public Subnet 1"
  }
}

resource "aws_route_table_association" "public-1" {
  subnet_id = "${aws_subnet.public-1.id}"
  route_table_id = "${aws_route_table.public-1.id}"
}

resource "aws_route_table" "public-2" {
  vpc_id = "${aws_vpc.services.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
  tags {
    Name = "Public Subnet 2"
  }
}

resource "aws_route_table_association" "public-2" {
  subnet_id = "${aws_subnet.public-2.id}"
  route_table_id = "${aws_route_table.public-2.id}"
}