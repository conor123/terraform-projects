/*
 * Web Servers
 */
resource "aws_instance" "web-1" {
    ami = "${lookup(var.amis, "web_server")}"
    availability_zone = "${var.availability_zones["zone_1a"]}"
    instance_type = "${var.web_server_instance_type}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.web.id}"]
    subnet_id = "${aws_subnet.eu-west-1a-public.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "Web Server 1"
    }
}
