provider "aws" {
  version = "2.12.0"
  region = "us-west-2"
  profile = "terraform-user"
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
