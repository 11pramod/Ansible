data "aws_vpc" "ansible" {
  id = "vpc-091629f2bcba44e35"
}

data "aws_route_table" "ansible_vpc_rt" {
  subnet_id = "subnet-0bb111a20b2550319"
}


resource "aws_vpc_peering_connection" "foo" {
  peer_vpc_id = data.aws_vpc.ansible.id
  vpc_id      = aws_vpc.vpc1.id
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "Ansible-${var.vpc}-Peering"
  }
}

resource "aws_route" "peering-to-ansible-vpc" {
  route_table_id            = aws_route_table.public_subnet.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id
  #depends_on                = [aws_route_table.terraform-public]
}

resource "aws_route" "peering-from-ansible-vpc" {
  route_table_id            = data.aws_route_table.ansible_vpc_rt.id
  destination_cidr_block    = "10.36.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.foo.id
  #depends_on                = [aws_route_table.terraform-public]
}
