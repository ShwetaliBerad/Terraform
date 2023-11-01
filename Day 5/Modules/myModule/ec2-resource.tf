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

resource "aws_instance" "my-ec2"{
    ami = "ami-04cb4ca688797756f"
    instance_type = "t2.micro"
}