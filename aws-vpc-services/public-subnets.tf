resource "aws_subnet" "public-1" {
    vpc_id = "${aws_vpc.services.id}"
    cidr_block = "${var.cidr_block_public_subnet_1}"
    availability_zone = "${lookup(var.availability_zones, "zone_1a")}"
    tags {
        Name = "Public 1"
    }
}

resource "aws_subnet" "public-2" {
    vpc_id = "${aws_vpc.services.id}"
    cidr_block = "${var.cidr_block_public_subnet_2}"
    availability_zone = "${lookup(var.availability_zones, "zone_1b")}"
    tags {
        Name = "Public 2"
    }
}
