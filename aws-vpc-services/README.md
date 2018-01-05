About
========
A Services VPC to manage tooling outside of production applicaiton scope.
- CICD pipelines
- Test or Demo Environments

In this project we will build AWS Infrastructure for type 2 VPC:
- VPC
- Public & private subnets
- Internet Gateway
- Nat instance
- Routing Tables
- ACLs & SGs
- EIPs
- Web servers
- Database servers, possibly via RDS?

Perfect for modern data driven web apps

Notes
======
terraform plan

TODO
====
- ASGs

AMIs
====
#web_server = "ami-acd005d5" # Amazon Linux AMI 2017.09.0 (HVM), SSD Volume Type - ami-acd005d5
#web_server = "ami-6865aa11" # Chef Centos 7 box
#eu-west-1 = "ami-06d11e7f" # Ubuntu xenial 16.04 LTS, EU West 1
#web_server = "ami-acd005d5" # Amazon Linux AMI 2017.09.0 (HVM), SSD Volume Type - ami-acd005d5
#web_server = "ami-6865aa11" # Chef Centos 7 box
#nat_instance = "ami-30913f47" # amzn-ami-vpc-nat-pv-2014.09.1.x86_64-eb