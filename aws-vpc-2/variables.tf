variable "aws_key_path" {}

variable "aws_key_name" {}

variable "vpc_region" {
    default = "eu-west-1"
}

variable "vpc_amis" {
    type = "map"
    description = "VPC AMIs"
    default = {
        eu-west-1 = "ami-06d11e7f" # ubuntu xenial 16.04 LTS
    }
}
# Not currently used, nat gateway preferred
variable "nat-instance-amis" {
    type = "map"
    description = "NAT Instance AMIs"
    default = {
        eu-west-1 = "ami-30913f47"
    }
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