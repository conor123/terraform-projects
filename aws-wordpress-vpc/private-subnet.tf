# eu_west_1a_private
resource "aws_subnet" "private_1a" {
    vpc_id = "${aws_vpc.wordpress.id}"
    cidr_block = "${var.private_subnet_cidr_block}"
    availability_zone = "${lookup(var.availability_zones, "zone_1a")}"
    tags {
        Name = "Private Subnet"
    }
}
