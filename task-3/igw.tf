resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.task3.id}"
  tags        = "${var.tags}"
}