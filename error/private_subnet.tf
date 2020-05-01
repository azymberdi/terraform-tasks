resource "aws_subnet" "private1" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.private1_cidr}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "private2" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.private2_cidr}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "private3" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.private3_cidr}"
    tags        = "${var.tags}"
}