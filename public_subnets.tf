resource "aws_subnet" "public" {
  count             = length(local.subnet_public_cidr)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = element(var.subnet_public_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    name        = "${var.vpc}-public-subnet-${count.index + 1}"
    environment = local.environment
  }
}
