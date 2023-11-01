terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0"
    }
  }

  backend "s3" {
    bucket = "terraform-aws-123"
    key    = "s3RemoteStatetf.state"
    region = "us-east-1"
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
/*
locals {
    service_name = "myService"
    owner = "aws"
    # Common tags to be assigned to all resources
    common_tags = {
        Service = local.service_name
        Owner   = local.owner
    }
}

resource "aws_instance" "app_server1"{
    ami = "ami-04cb4ca688797756f"
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_vpc" "vpc"{
    cidr_block = "10.0.0.0/16"
    tags = local.common_tags
}
*/