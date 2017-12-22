resource "aws_subnet" "eu-west-1a-public" {
    vpc_id = "${aws_vpc.t2_vpc.id}"
    cidr_block = "${var.public_subnet_cidr_block}"
    availability_zone = "eu-west-1a"
    tags {
        Name = "Public Subnet"
    }
}
