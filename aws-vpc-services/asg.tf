resource "aws_autoscaling_group" "scalegroup" {
  launch_configuration = "${aws_launch_configuration.webcluster.name}"
  vpc_zone_identifier = ["${aws_subnet.public-1.id}","${aws_subnet.public-2.id}"]
  #availability_zones = ["${data.aws_availability_zones.allzones.names}"]
  availability_zones = ["${data.aws_availability_zones.allzones.names}"]
  min_size = 2
  max_size = 4
  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]
  metrics_granularity="1Minute"
  load_balancers= ["${aws_elb.elb1.id}"]
  health_check_type="ELB"
  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}