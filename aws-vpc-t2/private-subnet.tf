resource "aws_subnet" "eu-west-1a-private" {
    vpc_id = "${aws_vpc.t2_vpc.id}"
    cidr_block = "${var.private_subnet_cidr_block}"
    availability_zone = "${lookup(var.availability_zones, "zone_1a")}"
    tags {
        Name = "Private Subnet"
    }
}
