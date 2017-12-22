provider "aws" {
  region = "${var.vpc_region}"
  shared_credentials_file = "${var.aws_credentials_path}"
}