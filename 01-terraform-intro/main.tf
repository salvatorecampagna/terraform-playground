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
  tags = {
    Name = "ec2-instance0"
    Author = "Salvatore Campagna (salvatore.campagna@acmelabs.com)"
    Organization = "Acme Labs"
  }
}
