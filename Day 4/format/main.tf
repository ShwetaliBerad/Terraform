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

resource "aws_instance" "app_server1" {
  ami = "ami-04cb4ca688797756f"
  instance_type = "t2.micro"
  tags = {
    name = "ExampleAppServerInstance1"
  }
  key_name = "myKey"

  provisioner "file" {
    source      = "conf/test.txt"
    destination = "/tmp/test.txt"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("D:\\Terraform\\Day 2\\provisioner\\remote-exec\\myKey.pem")
      host        = self.public_ip
    }
  }

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/file.log"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("D:\\Terraform\\Day 2\\provisioner\\remote-exec\\myKey.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "ls -l /tmp  >> myFile.txt"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("D:\\Terraform\\Day 2\\provisioner\\remote-exec\\myKey.pem")
      host        = self.public_ip
    }
  }
}