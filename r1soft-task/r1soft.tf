provider "aws" {
  region  = "us-east-1" #london worked but other does not 
  version = "2.59"
}

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
}

resource "aws_key_pair" "eu-west-2-key" {
  key_name   = "my_bastion"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "centos" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.eu-west-2-key.key_name}"

  security_groups = [
    "${aws_security_group.allow.name}",
  ]
}

resource "aws_security_group" "allow" {
  name        = "allow_me"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "centos" {
  value = "${data.aws_ami.centos.id}"
}

output "username" {
  value = "r1softteam3"
}

output "password" {
  value = "mystrongpassword"
}
