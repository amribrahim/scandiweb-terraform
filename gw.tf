resource "aws_internet_gateway" "magento-gateway" {
  vpc_id = "${aws_vpc.magento-vpc.id}"

  tags = {
    Name = "magento-gateway"
  }
}

