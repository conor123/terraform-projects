# Remember to change users name / location
provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "/Users/cr/.aws/terraform-aws-creds"
  #shared_credentials_file  = "${pathexpand(${~/.aws/terraform-aws-creds})}" # Requires recent version of tf to expand ~
}
