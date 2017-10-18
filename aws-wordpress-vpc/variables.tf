/**
* Keys
*/
variable "aws_key_path" {}

variable "aws_key_name" {}

variable "aws_credentials_path" {}

variable "chef_user" {}

variable "chef_user_key_path" {}

variable "chef_server_url" {}

/**
* Network
*/
variable "vpc_region" {
    default = "eu-west-1"
}

variable "availability_zones" {
    type = "map"

    default = {
        zone_1a = "eu-west-1a"
        zone_1b = "eu-west-1b"
        zone_1c = "eu-west-1c"
    }
}

variable "http_port" {
    default = 80
}

variable "vpc_cidr_block" {
    description = "VPC CIDR block"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
    description = "Public Subnet CIDR block"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr_block" {
    description = "Private Subnet CIDR block"
    default = "10.0.1.0/24"
}
/**
* EC2 AMIs
*/
variable "amis" {
    type = "map"
    description = "AMIs"
    default = {
        #eu-west-1 = "ami-06d11e7f" # ubuntu xenial 16.04 LTS
        web_server = "ami-bb9a6bc2" # Red Hat Enterprise Linux 7.4 (HVM), SSD Volume Type - ami-bb9a6bc2
        database_server = "ami-bb9a6bc2" # Red Hat Enterprise Linux 7.4 (HVM), SSD Volume Type - ami-bb9a6bc2
        nat_instance = "ami-30913f47" # amzn-ami-vpc-nat-pv-2014.09.1.x86_64-eb
    }
}

/**
* EC2 Instance Types
*/
variable "database_server_instance_type" {
    default = "t2.micro"
}

variable "web_server_instance_type" {
    default = "t2.micro"
}