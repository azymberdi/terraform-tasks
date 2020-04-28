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

resource "aws_ebs_volume" "task1" {
 availability_zone = "us-west-2a"
  size              = 100
}

resource "aws_volume_attachment" "task1" {
    device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.task1.id}"
  instance_id = "${aws_instance.web.id}"
}
