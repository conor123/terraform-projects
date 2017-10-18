resource "aws_internet_gateway" "main" {
    vpc_id = "${aws_vpc.wordpress.id}"
}
