resource "aws_route_table" "gw-routetable" {
  vpc_id = "${aws_vpc.magento-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.magento-gateway.id}"
  }
 

  tags = {
    Name = "route_to_internet"
  }
}

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.prod-pub-1.id
  route_table_id = aws_route_table.gw-routetable.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.prod-pub-2.id
  route_table_id = aws_route_table.gw-routetable.id
}

#resource "aws_route_table" "private-routing1" {
#  vpc_id = "${aws_vpc.magento-vpc.id}"

#  route {
#    cidr_block = "0.0.0.0/0"
#    nat_gateway_id = "${aws_nat_gateway.magento-ngw1.id}"
#  }

#  tags = {
#    Name = "private-routing1"
#  }
#}


#resource "aws_route_table_association" "subnet-private1" {
#  subnet_id      = aws_subnet.prod-pvt-1.id
#  route_table_id = aws_route_table.private-routing1.id
#}

#resource "aws_route_table_association" "subnet-private2" {
#  subnet_id      = aws_subnet.prod-pvt-2.id
#  route_table_id = aws_route_table.private-routing1.id
#}

