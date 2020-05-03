provider "aws" {
  region  = "eu-west-2" #london worked but other does not 
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
  key_name   = "farrukhs_bastion"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
resource "aws_instance" "centos" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  key_name      =   "${aws_key_pair.eu-west-2-key.key_name}"
  provisioner "remote-exec" {
    connection {
        type            = "ssh"
        user            = "centos"
        private_key     = "${file("~/.ssh/id_rsa")}"
        host            = "${self.public_ip}"
    }
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl start httpd ",
    ]
  }
}
output "centos" {
  value = "${data.aws_ami.centos.id}"
}