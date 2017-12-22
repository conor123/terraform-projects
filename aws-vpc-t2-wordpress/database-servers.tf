resource "aws_instance" "database_server_1" {
    ami = "${lookup(var.amis, "database_server")}"
    availability_zone = "${var.availability_zones["zone_1a"]}"
    instance_type = "${var.database_server_instance_type}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.db_server.id}"]
    subnet_id = "${aws_subnet.private_1a.id}"
    source_dest_check = false
    tags {
        Name = "DB Server 1"
    }
}
