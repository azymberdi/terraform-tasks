resource "aws_key_pair" "eu-west-1-key" {
  key_name   = "ray-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}