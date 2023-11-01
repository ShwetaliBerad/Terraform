terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Set of Strings
resource "aws_iam_user" "accounts"{
    for_each = toset(["Todd","James","Alice","Dottie"])
    name = each.key
}

# Map
resource "aws_vpc" "vpc"{
    for_each = {
        default = "10.0.0.0/16"
        sql = "100.0.0.0/16"
    }
    cidr_block = each.value
    tags = {
        name = each.key
    }
}