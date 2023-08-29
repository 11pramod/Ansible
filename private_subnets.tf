resource "aws_subnet" "private" {
  count             = length(local.subnet_private_cidr)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = element(var.subnet_private_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    name        = "${var.vpc}-private-subnet-${count.index + 1}"
    environment = local.environment
  }
}
