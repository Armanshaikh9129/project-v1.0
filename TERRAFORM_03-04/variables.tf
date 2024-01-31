variable "aws_region" {
  type = string
}

variable "cidr" {
  type = string
}

variable "resource_name" {
  type = string
}


variable "subnets" {
  type = object({
    cidr-pub1 = string,
    cidr-pub2 = string,
    cidr-pvt1 = string,
    cidr-pvt2 = string
  })
}


variable "nat_allocation" {
  type = string
}

variable "nat_gateway_name" {
  type = string

}

variable "route_cidr" {
  type = string
}

variable "route_cidr2" {
  type = string
}


variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_pair_name" {
  type = string

}

