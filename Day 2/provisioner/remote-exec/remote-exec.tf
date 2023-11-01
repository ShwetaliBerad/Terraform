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
    key_name = "myKey"

    provisioner "remote-exec" {
        inline = [
            "sudo yum install -y nginx",
            "sudo service nginx start",
            "sudo chkconfig nginx on"
        ]

        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("D:\\Terraform\\Day 2\\provisioner\\remote-exec\\myKey.pem")
            host = self.public_ip
        }
    }
}