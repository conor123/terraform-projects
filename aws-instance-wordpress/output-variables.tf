output "Public DNS address" {
  value = "${aws_instance.web_server_1.public_dns}"
}
