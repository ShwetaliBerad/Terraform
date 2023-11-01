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
  region = var.aws_region
}

resource "aws_instance" "app_server1"{
    ami = lookup(var.aws_amis, var.aws_region)
    instance_type = "t2.micro"
    tags = {
        name = "ExampleAppServerInstance1"
    }
}