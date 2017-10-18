resource "aws_elb" "asg" {
  name = "elb-asg"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  security_groups = ["${aws_security_group.elb.id}"]

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "${var.http_port}"
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:${var.http_port}/"
  }
}