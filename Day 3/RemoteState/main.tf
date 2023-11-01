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

resource "aws_iam_user" "testuser" {
  name = "test-user"
  path = "/system/"
  tags = {
    tag-key = "test"
  }
}