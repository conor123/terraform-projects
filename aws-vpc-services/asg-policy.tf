resource "aws_autoscaling_policy" "autopolicy" {
  name = "terraform-autopolicy"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.scalegroup.name}"
}

resource "aws_autoscaling_policy" "autopolicy-down" {
  name = "terraform-autopolicy-down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.scalegroup.name}"
}