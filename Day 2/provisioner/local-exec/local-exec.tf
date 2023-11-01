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
  region = "us-west-2"
}

resource "aws_instance" "app_server1"{
    ami = "ami-07e70003c665fb5f3"
    instance_type = "t2.micro"
    tags = {
        name = "ExampleAppServerInstance1"
    }
    provisioner "local-exec" {
    command = "echo %FOO% %BAR% %BAZ% >> env_vars.txt"

    environment = {
      FOO = "bar"
      BAR = 1
      BAZ = "true"
    }
  }
}

/*
resource "terraform_data" "example2" {
  provisioner "local-exec" {
    command = "Get-Date > completed.txt"
    interpreter = ["PowerShell", "-Command"]
  }
}
*/
