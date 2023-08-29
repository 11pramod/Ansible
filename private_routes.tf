resource "aws_route" "private_subnet" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    name        = "${var.vpc}-private RT"
    environment = local.environment
  }
}


resource "aws_route_table_association" "private-RT-ass" {
  count          = length(local.subnet_private_cidr)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route.private_subnet.id
}
