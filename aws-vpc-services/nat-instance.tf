/*
 * NAT Instance - less expensive alternative to NAT gateway
*/
resource "aws_security_group" "nat_instance" {
    name = "vpc_nat"
    description = "Private subnet traffic to internet"
    vpc_id = "${aws_vpc.services.id}"

    tags {
      Name = "NAT-instance-SG"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${var.cidr_block_private_subnet_1}"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.cidr_block_private_subnet_1}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.cidr_block_vpc}"]
    }

    egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "nat" {
    ami = "${lookup(var.amis, "nat_instance")}" # Designated NAT AMI
  availability_zone = "${var.availability_zones["zone_1a"]}"
  instance_type = "${var.nat_instance_type}" # usually: m1.small
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.nat_instance.id}"]
    subnet_id = "${aws_subnet.public-1.id}"
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

