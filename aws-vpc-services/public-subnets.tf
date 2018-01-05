resource "aws_subnet" "public-1" {
    vpc_id = "${aws_vpc.services.id}"
    cidr_block = "${var.cidr_block_public_subnet_1}"
    availability_zone = "eu-west-1a"
    tags {
        Name = "eu-west-1a-public"
    }
}
