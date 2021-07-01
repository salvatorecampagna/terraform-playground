terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 2.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2-instance0" {
  ami = "ami-09dd2e08d601bff67"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.default_security_group.id]

  tags = {
    Name = "ec2-instance0"
    Author = "Salvatore Campagna (salvatore.campagna@acmelabs.com)"
    Organization = "Acme Labs"
  }

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > index.html
    nohup busybox httpd -f -p 8080 &
  EOF
}

resource "aws_security_group" "default_security_group" {
  name = "default_security_group"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
