resource "aws_launch_configuration" "webcluster" {
  image_id= "${lookup(var.amis, "web_server")}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web.id}"]

    user_data = <<-EOF
    #!/bin/bash
    echo "hello, I am WebServer" >index.html
    nohup busybox httpd -f -p 80 &
    EOF

  lifecycle {
    create_before_destroy = true
  }
}