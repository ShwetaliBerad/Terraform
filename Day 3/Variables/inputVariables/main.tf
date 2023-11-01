terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server1"{
    ami = var.image_id
    instance_type = "t2.micro"
}

# Set of Strings
resource "aws_iam_user" "accounts"{
    for_each = toset(var.users)
    name = each.key
}

# Map
resource "aws_vpc" "vpc"{
    for_each = var.vpcs
    cidr_block = each.value
    tags = {
        name = each.key
    }
}