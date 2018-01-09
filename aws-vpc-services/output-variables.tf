output "availabilityzones" {
  value = ["${data.aws_availability_zones.available.names}"]
}

