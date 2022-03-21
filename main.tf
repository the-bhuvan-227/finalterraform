provider "aws" {
  profile    = "default"
  region     = "us-east-1"
  access_key = "AKIA6CY7YXRWMWENZ4FC"
  secret_key = "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"
}

variable vpc_cidr_block {}
variable subnet_cidr_block {}
variable avail_zone {}
variable env_prefix {}


resource "aws_vpc" "my-custome-vpc" {
  cidr_block       =  var.vpc_cidr_block
 /* instance_tenancy = "default" */
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

resource "aws_subnet" "my-custome-subnet" {
  vpc_id     = aws_vpc.my-custome-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.avail_zone
  tags = {
    Name = "${var.env.prefix}-subnet-1"
  }
}