resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.services.id}"
}
