resource "aws_subnet" "public1" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.public1_cidr}"
    map_public_ip_on_launch =   "true"
    availability_zone   =   "${var.region}${var.az1}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "public2" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.public2_cidr}"
    map_public_ip_on_launch =   "true"
    availability_zone   =   "${var.region}${var.az2}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "public3" {
    vpc_id     = "${aws_vpc.task3.id}"
    cidr_block = "${var.public3_cidr}"
    map_public_ip_on_launch =   "true"
    availability_zone   =   "${var.region}${var.az3}"
    tags        = "${var.tags}"
}