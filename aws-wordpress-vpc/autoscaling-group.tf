resource "aws_autoscaling_group" "web_servers" {
  launch_configuration = "${aws_launch_configuration.web_servers.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  #vpc_zone_identifier = ["${lookup(var.availability_zones, "zone_1a")}}"]# Not sure about this, investigate further

  min_size = 2
  max_size = 4

  load_balancers = ["${aws_elb.asg.name}"]
  health_check_type = "ELB"

  tag {
    key = "Name"
    value = "WP ASG"
    propagate_at_launch = true
  }
}