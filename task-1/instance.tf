resource "aws_instance" "web" {
  ami           = "ami-0d6621c01e8c2de2c"
  instance_type = "t2.large"
  availability_zone = "us-west-2a"
  key_name      = "${aws_key_pair.eu-west-2-key.key_name}"
  security_groups = ["${aws_security_group.task1-sg.name}"] 
  user_data = "${file("httpd.sh")}"
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_volume" "task1-ebs" {
 availability_zone = "us-west-2a"
  size              = 100
}

resource "aws_volume_attachment" "task1" {
    device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.task1-ebs.id}"
  instance_id = "${aws_instance.web.id}"
}



