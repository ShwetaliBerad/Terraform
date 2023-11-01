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
/*
resource "aws_security_group" "example" {
  name = "newtest2"
}
*/

resource "aws_security_group" "example" {
  name = "newtest1"
  lifecycle {
    create_before_destroy = true
  }
}
