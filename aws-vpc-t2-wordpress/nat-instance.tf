/*
 * NAT Instance - less expensive alternative to NAT gateway
*/
resource "aws_instance" "nat" {
    ami = "${lookup(var.amis, "nat_instance")}" # NAT AMI
    availability_zone = "eu-west-1a"
    instance_type = "t2.micro" # usually: m1.small
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.nat_instance.id}"] # CHECK THIS!
    subnet_id = "${aws_subnet.public_1a.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "VPC NAT"
    }
}

resource "aws_eip" "nat" {
    instance = "${aws_instance.nat.id}"
    vpc = true
}

