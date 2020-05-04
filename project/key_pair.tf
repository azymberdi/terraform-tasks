resource "aws_key_pair" "project-key" {
  key_name   = "ray-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}