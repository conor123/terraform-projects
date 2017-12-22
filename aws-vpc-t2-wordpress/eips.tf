resource "aws_eip" "eip_nat" {
  vpc = true
}

resource "aws_eip" "eip_web_1" {
  instance = "${aws_instance.web_server_1.id}"
  vpc = true
}

