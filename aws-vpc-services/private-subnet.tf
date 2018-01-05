resource "aws_subnet" "private-1" {
    vpc_id = "${aws_vpc.services.id}"
    cidr_block = "${var.cidr_block_private_subnet_1}"
    availability_zone = "${lookup(var.availability_zones, "zone_1a")}"
    tags {
        Name = "Private Subnet"
    }
}
