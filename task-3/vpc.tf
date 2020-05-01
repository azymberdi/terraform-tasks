resource "aws_vpc" "task3" {
  cidr_block = "${var.vpc_cidr}"
  tags        = "${var.tags}"
}