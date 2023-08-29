resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    name        = "${var.vpc}-Main RT"
    environment = local.environment

  }

}

resource "aws_route" "igw-route" {
  route_table_id         = aws_route_table.public_subnet.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig1.id

}


resource "aws_route_table_association" "public_subent_RT_Association" {
  route_table_id = aws_route_table.public_subnet.id
  count          = length(local.subnet_private_cidr)
  subnet_id      = element(aws_subnet.public.*.id, count.index)

}
