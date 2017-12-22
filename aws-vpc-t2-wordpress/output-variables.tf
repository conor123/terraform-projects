output "elb_asg_dns_name" {
  value = "${aws_elb.asg.dns_name}"
}

