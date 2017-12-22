resource "aws_vpc" "t2_vpc" {
    cidr_block = "${var.vpc_cidr_block}"
    enable_dns_hostnames = true
    tags {
        Name = "VPC Type 2 Example"
    }
}