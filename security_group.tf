resource "aws_security_group" "SG-loadbalancer" {
    vpc_id = "${aws_vpc.magento-vpc.id}"
    name = "SG-loadbalancer"
    
   tags ={
    Name = "SG-loadbalancer"
  }
}


resource "aws_security_group_rule" "all-http" {
  security_group_id = "${aws_security_group.SG-loadbalancer.id}"
  type = "ingress"
  from_port = "80"
  to_port = "80"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_lb" {
  security_group_id = "${aws_security_group.SG-loadbalancer.id}"
  description = "Allow All Traffic from loadbalancer"
  type = "egress"
  from_port = "0"
  to_port = "65535"
  protocol = "All"
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group" "SG-instance" {
    vpc_id = "${aws_vpc.magento-vpc.id}"
    name = "SG-instance"
    
   tags ={
    Name = "SG-instance"
  }
}
resource "aws_security_group_rule" "to_instance" {
  security_group_id = "${aws_security_group.SG-instance.id}"
  type = "ingress"
  from_port = "80"
  to_port = "80"
  protocol = "tcp"
  source_security_group_id="${aws_security_group.SG-loadbalancer.id}"
}

resource "aws_security_group_rule" "ssh_instance" {
security_group_id = "${aws_security_group.SG-instance.id}"
type = "ingress"
from_port = "22"
to_port = "22"
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ec2_all" {
  security_group_id = "${aws_security_group.SG-instance.id}"
  description = "Allow All Traffic Among VPC Instances"
  type = "ingress"
  from_port = "0"
  to_port = "65535"
  protocol = "All"
  cidr_blocks = ["172.31.0.0/16"]
}

resource "aws_security_group_rule" "outbound_all" {
  security_group_id = "${aws_security_group.SG-instance.id}"
  description = "Allow All Traffic Among VPC Instances"
  type = "egress"
  from_port = "0"
  to_port = "65535"
  protocol = "All"
  cidr_blocks = ["0.0.0.0/0"]
}
