resource "aws_route_table" "public_1a" {
  vpc_id = "${aws_vpc.wordpress.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }
  tags {
    Name = "Public Subnet"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id = "${aws_subnet.public_1a.id}"
  route_table_id = "${aws_route_table.public_1a.id}"
}


resource "aws_route_table" "private_1a" {
  vpc_id = "${aws_vpc.wordpress.id}"
  route {
    cidr_block = "0.0.0.0/0"
    #nat_gateway_id = "${aws_nat_gateway.nat-gw.id}" # Id using GW over Instance
    instance_id = "${aws_instance.nat.id}"
  }
  tags {
    Name = "Private Subnet"
  }
}

resource "aws_route_table_association" "private_1a" {
  subnet_id = "${aws_subnet.private_1a.id}"
  route_table_id = "${aws_route_table.private_1a.id}"
}
