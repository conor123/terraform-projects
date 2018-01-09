resource "aws_autoscaling_group" "scalegroup" {
  vpc_zone_identifier = [ "${aws_subnet.public-1.id}" ]
  #availability_zones = ["eu-west-1a","eu-west-1b"]
  load_balancers = ["${aws_elb.elb1.id}"]
  launch_configuration = "${aws_launch_configuration.webcluster.name}"
  health_check_type="ELB"
  min_size = 2
  max_size = 4
  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]
  metrics_granularity="1Minute"

  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}