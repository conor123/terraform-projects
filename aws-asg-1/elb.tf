resource "aws_elb" "elb1" {
  name = "terraform-elb"
  availability_zones = ["${data.aws_availability_zones.allzones.names}"]
  security_groups = ["${aws_security_group.elbsg.id}"]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "terraform-elb"
  }

  /*
  access_logs {
    bucket = "elb-log.davidwzhang.com"
    bucket_prefix = "elb"
    interval = 5
  }
  */

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
}

resource "aws_lb_cookie_stickiness_policy" "cookie_stickness" {
  name = "cookiestickness"
  load_balancer = "${aws_elb.elb1.id}"
  lb_port = 80
  cookie_expiration_period = 600
}