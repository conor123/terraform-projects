# Remember to change users name / location in shared file location
provider "aws" {
  region = "${var.vpc_region}"
  shared_credentials_file = "/Users/cr/.aws/terraform-aws-creds"
}
