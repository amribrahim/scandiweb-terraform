data "aws_availability_zones" "available" {
  state = "available"
} 
resource "aws_subnet" "prod-pub-1" {
  vpc_id     = "${aws_vpc.magento-vpc.id}"
  cidr_block = "172.31.0.0/20"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = true
  tags = {
    Name="prod-pub-1"
  }
}

resource "aws_subnet" "prod-pub-2" {
  vpc_id     = "${aws_vpc.magento-vpc.id}"
  cidr_block = "172.31.16.0/20"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = true

  tags = {
    Name="prod-pub-2"
  }
}

resource "aws_subnet" "prod-pvt-2" {
  vpc_id     = "${aws_vpc.magento-vpc.id}"
  cidr_block = "172.31.64.0/20"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags = {
    Name="prod-pvt-2"
  }
}
resource "aws_subnet" "prod-pvt-1" {
  vpc_id     = "${aws_vpc.magento-vpc.id}"
  cidr_block = "172.31.32.0/20"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name="prod-pvt-1"
  }
}
