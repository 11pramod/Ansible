resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    name        = var.vpc
    environment = local.environment
  }

}


resource "aws_internet_gateway" "ig1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    name        = "${var.vpc}-igw"
    environment = local.environment
  }

}
