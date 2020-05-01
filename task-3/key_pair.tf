resource "aws_key_pair" "eu-west-1-key" {
    key_name      =     "task3-key"
    tags          =     "${var.tags}"
    public_key    =     "${file("~/.ssh/id_rsa.pub")}"
}