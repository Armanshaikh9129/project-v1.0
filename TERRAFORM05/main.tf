terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

 resource "aws_ami_from_instance" "my_ami" {
 name               =  "ami_id"
 source_instance_id        = "i-0f87567c51f0ca5ce"
 }


resource "aws_instance" "web" {

  ami           = aws_ami_from_instance.my_ami.id
  instance_type = "t2.micro"
  key_name = "arman_key"
  availability_zone = "ap-south-1a"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  tags = {
    Name = "using_ami"
  }
}

resource "aws_security_group" "my_security_group" {
  name        = "dynamic_block"
  description = "using list"

  dynamic "ingress" {
    for_each = var.security_group_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.security_group_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
