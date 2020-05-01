resource "aws_route_table" "rt2" {
  vpc_id = "${aws_vpc.task3.id}"
  tags        = "${var.tags}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.ngw.id}"
  }
}

# Route Table association
resource "aws_route_table_association" "a1" {
  subnet_id      = "${aws_subnet.private1.id}"
  route_table_id = "${aws_route_table.rt2.id}"
}
resource "aws_route_table_association" "a2" {
  subnet_id      = "${aws_subnet.private2.id}"
  route_table_id = "${aws_route_table.rt2.id}"
}
resource "aws_route_table_association" "a3" {
  subnet_id      = "${aws_subnet.private3.id}"
  route_table_id = "${aws_route_table.rt2.id}"
}