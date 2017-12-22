resource "aws_subnet" "public_1a" {
    vpc_id = "${aws_vpc.wordpress.id}"
    cidr_block = "${var.public_subnet_cidr_block}"
    availability_zone = "${lookup(var.availability_zones, "zone_1a")}"
    tags {
        Name = "Public Subnet 1a"
    }
}
