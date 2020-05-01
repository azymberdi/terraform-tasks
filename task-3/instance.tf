resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id     =   "${aws_subnet.public1.id}"
  key_name      = "${aws_key_pair.eu-west-1-key.key_name}"
  user_data = "${file("httpd.sh")}"
      security_groups = [
        "${aws_security_group.task3_sg.id}"
    ]
  tags        = "${var.tags}"
}