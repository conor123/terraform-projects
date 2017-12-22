resource "aws_eip" "eip-nat" {
  vpc = true
}

resource "aws_eip" "web-1" {
  instance = "${aws_instance.web-1.id}"
  vpc = true
}

