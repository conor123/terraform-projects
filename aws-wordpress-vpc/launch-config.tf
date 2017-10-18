# For Autoscaling groups
resource "aws_launch_configuration" "web_servers" {
  image_id = "${lookup(var.amis, "web_server")}"
  instance_type = "${var.web_server_instance_type}"
  security_groups = ["${aws_security_group.web_server.id}"]

  lifecycle {
    # Create the new Instance before deleting old one
    create_before_destroy = true
  }
}
