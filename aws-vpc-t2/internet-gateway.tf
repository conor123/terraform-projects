resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.t2_vpc.id}"
}
