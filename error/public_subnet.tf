resource "aws_subnet" "public1" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.public1_cidr}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "public2" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.public2_cidr}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "public3" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.public3_cidr}"
    tags        = "${var.tags}"
}