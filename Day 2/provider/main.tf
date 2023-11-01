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

provider "aws" {
  alias = "USWest2"
  region = "us-west-2"
}

resource "aws_instance" "app_server1"{
    ami = "ami-01c647eace872fc02"
    instance_type = "t2.micro"
    tags = {
        name = "ExampleAppServerInstance1"
    }
}

resource "aws_instance" "app_server2"{
    ami = "ami-0b2b4f610e654d9ac"
    provider = aws.USWest2
    instance_type = "t2.micro"
    tags = {
        name = "ExampleAppServerInstance2"
    }
}