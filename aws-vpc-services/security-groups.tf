/*
* Web SG
*/
resource "aws_security_group" "web" {
  name = "webserver"
  description = "Allow incoming HTTP"
  vpc_id = "${aws_vpc.services.id}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "WebServer-SG"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # MySQL
  egress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    #cidr_blocks = ["${var.cidr_block_private_subnet_1}"]
  }
}
/*
* ELB SG
*/
resource "aws_security_group" "elb" {
  name = "security_group_for_elb"
  vpc_id = "${aws_vpc.services.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}