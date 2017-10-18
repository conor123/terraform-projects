/*
 * Web Servers
 */
resource "aws_instance" "web_server_1" {
    ami = "${lookup(var.amis, "web_server")}"
    availability_zone = "${var.availability_zones["zone_1a"]}"
    instance_type = "${var.web_server_instance_type}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.web_server.id}"]
    subnet_id = "${aws_subnet.public_1a.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "Web Server 1"
    }

    // Please note that you will have to configure your chef server to bootstrap this node
    // Comment and configure if bootstrap is not required or configured
    /*
    provisioner "chef" {

        //environment     = "_default"
        //secret_key      = "${file("${var.chef_secret_key}")}"
        server_url      = "${var.chef_server_url}"
        user_name       = "${var.chef_user}"
        user_key        = "${file("${var.chef_user_key_path}")}"
        run_list        = ["role[wordpress-webserver]"]
        node_name       = "webserver-1"
        recreate_client = true
        fetch_chef_certificates = true
        //on_failure      = "continue"
        //version         = "12.4.1"
        connection {
            type        = "ssh"
            user        = "ec2-user" //
            private_key    = "${file("${var.aws_key_path}")}"
            //agent = false
        }
        attributes_json = <<-EOF
        {
            "app": {
                "cluster1": {
                      "nodes": [
                        "webserver-1"
                    ]
                }
            }
        }
        EOF
    }
    */
}
