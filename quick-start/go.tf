provider "aws" {
  access_key = "key_here"
  secret_key = "secret_here"
  region     = "us-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-06d11e7f"
  instance_type = "t2.micro"
}