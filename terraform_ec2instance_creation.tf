provider "aws" {
  profile    = "hari"
  access_key = "AKIA26WXJ7ZRXI7GTFH5"
  secret_key = "TjvCmhUChkggpKxf3C1sEC4AqIL8IBvhbJz+VlWg"
  region     = "us-east-2"
}
resource "aws_instance" "example" {
  ami       = "ami-0fa49cc9dc8d62c84"
tags= {
Name="linux"
}
  instance_type = "t2.micro"
  key_name               = "sai"
  security_groups        = ["${aws_security_group.allow_ssh.name}"]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow ssh traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
