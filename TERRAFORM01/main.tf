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

resource "aws_iam_user" "user1" {
  name = var.username
  path = var.Path

  tags = {
    tag-key = var.tags
  }
}

resource "aws_iam_group" "terraform" {
  name = var.groupname
}
