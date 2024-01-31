terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  
}

resource "aws_instance" "ec2" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  subnet_id     = aws_subnet.public_subnet1.id
  availability_zone = "ap-south-1a"

  tags = {
    Name = "EC2_Instance"
  }
}

resource "aws_vpc" "my_vpc1" {
  cidr_block = var.cidr

  tags = {
    Name = var.resource_name
  }
}


resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.my_vpc1.id
  cidr_block = var.subnets.cidr-pub1
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pub_subnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.my_vpc1.id
  cidr_block = var.subnets.cidr-pub2
  availability_zone = "ap-south-1b"
  tags = {
    Name = "pub_subnet2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.my_vpc1.id
  cidr_block = var.subnets.cidr-pvt1

}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.my_vpc1.id
  cidr_block = var.subnets.cidr-pvt2

}

resource "aws_internet_gateway" "this_internet_gateway" {
  vpc_id = aws_vpc.my_vpc1.id

}
resource "aws_eip" "lb1" {
  domain = "vpc"
}

resource "aws_nat_gateway" "this_nat_gateway" {
  allocation_id = aws_eip.lb1.id
  subnet_id     = aws_subnet.private_subnet1.id

  tags = {
    Name = var.nat_gateway_name
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.my_vpc1.id
  route {
    cidr_block = var.route_cidr
    gateway_id = aws_nat_gateway.this_nat_gateway.id
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.my_vpc1.id
  route {
    cidr_block     = var.route_cidr2
    nat_gateway_id = aws_nat_gateway.this_nat_gateway.id
  }
}


