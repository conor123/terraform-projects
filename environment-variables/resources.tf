resource "aws_instance" "example" {
  ami           = "ami-06d11e7f"
  instance_type = "t2.micro"
}