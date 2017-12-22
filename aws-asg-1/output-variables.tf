output "availabilityzones" {
  value = ["${data.aws_availability_zones.allzones.names}"]
}

output "elb-dns" {
  value = "${aws_elb.elb1.dns_name}"
}