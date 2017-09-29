resource "aws_subnet" "eu-west-1a-private" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.private_subnet_cidr_block}"
    availability_zone = "eu-west-1a"
    tags {
        Name = "Private Subnet"
    }
}
