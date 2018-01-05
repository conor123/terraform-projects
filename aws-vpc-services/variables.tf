/**
* Keys
*/
variable "aws_key_path" {}

variable "aws_key_name" {}

variable "aws_credentials_path" {}

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

variable "cidr_block_vpc" {
    description = "VPC CIDR block"
    default = "10.0.0.0/16"
}

variable "cidr_block_public_subnet_1" {
    description = "Public Subnet CIDR block"
    default = "10.0.0.0/24"
}

variable "cidr_block_public_subnet_2" {
    description = "Public Subnet CIDR block"
    default = "10.0.1.0/24"
}

variable "cidr_block_private_subnet_1" {
    description = "Private Subnet CIDR block"
    default = "10.0.3.0/24"
}

variable "cidr_block_private_subnet_2" {
    description = "Private Subnet CIDR block"
    default = "10.0.4.0/24"
}

/**
* EC2 AMIs
*/
variable "amis" {
    type = "map"
    description = "AMIs"
    default = {
        web_server = "ami-bb9a6bc2" # Red Hat Enterprise Linux 7.4 (HVM), SSD Volume Type - ami-bb9a6bc2
        database_server = "ami-bb9a6bc2" # Red Hat Enterprise Linux 7.4 (HVM), SSD Volume Type - ami-bb9a6bc2
        nat_instance = "ami-076d5d61" #amzn-ami-vpc-nat-hvm-2017.03.rc-0.20170320-x86_64-ebss
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

variable "nat_instance_type" {
    default = "t2.micro"
}
