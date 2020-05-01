provider "aws" {
    region = "us-west-2"
    version = "2.59"
}

resource "aws_instance" "web" {
  ami           = "ami-0d6621c01e8c2de2c"
  instance_type = "t2.large"
  key_name      = "${aws_key_pair.eu-west-1-key.key_name}"
  security_groups = ["${aws_security_group.allow_tls.name}"]  
  user_data = "${file("httpd.sh")}"
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_key_pair" "eu-west-1-key" {
  key_name   = "ray-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
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

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_route53_record" "www" { 
  zone_id = "Z037571614TB3EDBQS25H" 
  name    = "gbeksbaby.com" 
  type    = "A" 
  ttl     = "300" 
  records = ["${aws_instance.web.public_ip}"]
}

output "instance_id" {
  value     =     "${aws_instance.web.id}"
}

output "key_name" {
  value     =     "${aws_instance.web.key_name}"
}

output "public_ip" {
  value     =     "${aws_instance.web.public_ip}"
}

output "instance_arn" {
  value     =     "${aws_instance.web.arn}"
}

output "public_dns" {
  value     =     "${aws_instance.web.public_dns}"
}

output "message" {
  value     =     "Log in to wordpress and reset your password"
}