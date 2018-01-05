resource "aws_vpc" "services" {
    cidr_block = "${var.cidr_block_vpc}"
    enable_dns_hostnames = true
    tags {
        Name = "Conortek.net Services VPC"
    }
}