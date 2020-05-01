resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.eip.id}"
  tags        = "${var.tags}"
  subnet_id     = "${aws_subnet.public1.id}"
}