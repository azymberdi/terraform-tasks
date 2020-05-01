resource "aws_subnet" "private1" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.private1_cidr}"
    map_public_ip_on_launch =   "false"
    availability_zone   =   "${var.region}${var.az1}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "private2" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.private2_cidr}"
    map_public_ip_on_launch =   "false"
    availability_zone   =   "${var.region}${var.az2}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "private3" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.private3_cidr}"
    map_public_ip_on_launch =   "false"
    availability_zone   =   "${var.region}${var.az3}"
    tags        = "${var.tags}"
}