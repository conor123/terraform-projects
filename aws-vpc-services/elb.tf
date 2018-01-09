resource "aws_elb" "elb1" {
  name = "terraform-elb"
  #availability_zones = ["eu-west-1a","eu-west-1b"]
  subnets = ["${aws_subnet.public-1.id}"]
  security_groups = ["${aws_security_group.elb.id}"]
  cross_zone_load_balancing = false
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "terraform-elb"
  }

  /*
  access_logs {
    bucket = "elb-log.example.com"
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