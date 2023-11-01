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
    ami = "ami-04cb4ca688797756f"
    instance_type = "t2.micro"
    tags = {
        name = "ExampleAppServerInstance1"
    }
}

output "instance_ip_addr" {
  value       = aws_instance.app_server1.private_ip
  description = "The private IP address of the main server instance."
}
